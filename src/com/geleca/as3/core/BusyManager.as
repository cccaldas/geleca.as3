package com.geleca.as3.core 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import com.geleca.as3.events.BusyManagerEvent;
	import com.geleca.as3.events.SimpleEventDispatcher;
	import com.geleca.as3.util.DepthUtil;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class BusyManager extends SimpleEventDispatcher
	{
		public static const BUSY				:String = "BUSY";
		public static const AVAILABLE			:String = "AVAILABLE";
		
		private var _busyOperations             :int = 0;
		
		private var _stage						:Stage = null;
		private var _blockObject				:Sprite;
		
		private var _status						:String = null;
		
		public function BusyManager(stage:Stage=null) 
		{
			super();
			
			_blockObject = new Sprite();
			_blockObject.graphics.beginFill(0x0000ff,0);
			_blockObject.graphics.drawRect(0, 0, 100, 100);
			_blockObject.graphics.endFill();
			
			_blockObject.visible = false;
			
			_blockObject.addEventListener(Event.ADDED_TO_STAGE, blockObject_addedToStage);
			
			this.stage = stage;
		}
		
		public function busy():void 
		{
			setStatus(BUSY);
		}
		
		public function available():void 
		{
			setStatus(AVAILABLE);
		}
		
		private function setStatus(status:String):void 
		{
			_status = status;
			
			switch (status) 
			{
				case BUSY:
					if (_busyOperations == 0) 
					{
						DepthUtil.toFront(_blockObject);
						
						_blockObject.visible = true;
						stage_resize();
						
						dispatchEvent(new BusyManagerEvent(BusyManagerEvent.BUSY));
					}
				
					_busyOperations ++;
					
				break;
				
				case AVAILABLE:
					_busyOperations --;
				
					if (_busyOperations == 0) 
					{
						_blockObject.visible = false;
						
						dispatchEvent(new BusyManagerEvent(BusyManagerEvent.AVAILABLE));
					}
					
					if (_busyOperations < 0) _busyOperations = 0;
					
				break;
			}
			
		}
		
		private function blockObject_addedToStage(e:Event):void 
		{
			_blockObject.removeEventListener(Event.ADDED_TO_STAGE, blockObject_addedToStage);
			
			_stage.addEventListener(Event.RESIZE, 	stage_resize);
			_stage.addEventListener(Event.ADDED, 	stage_resize);
		}
		
		private function stage_resize(e:Event=null):void 
		{
			_blockObject.x 			= _blockObject.y = 0;
			_blockObject.width 		= _stage.stageWidth;
			_blockObject.height 	= _stage.stageHeight;
			
			DepthUtil.toFront(_blockObject);
		}
		
		override public function destroy():void 
		{
			if (_stage != null)
			{
				_stage.removeChild(_blockObject);
				_stage.removeEventListener(Event.RESIZE, 	stage_resize);
				_stage.removeEventListener(Event.ADDED, 	stage_resize);
			}
			
			_blockObject = null;
			
			super.destroy();
		}
		
		public function get status()		:String { return _status; }
		
		public function get stage():Stage { return _stage; }
		
		public function set stage(value:Stage):void 
		{
			if (value != null)
			{
				_stage = value;
				stage.addChild(_blockObject);
			}
		}
		
	}

}