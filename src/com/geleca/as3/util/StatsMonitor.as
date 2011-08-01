package com.geleca.as3.util
{
	import com.geleca.as3.debugger.GLog;
	
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.Capabilities;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.getTimer;

	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class StatsMonitor extends Sprite
	{
		private var _mem				:Number = 0;
		private var _timer				:Number = 0;
		private var _ms_prev			:Number = 0
		private var _fps				:uint = 0;
		
		private var txt_report			:TextField = new TextField();
		
		public function StatsMonitor(background:uint=0x000000) 
		{
			super();
			
			this.graphics.beginFill(background);
			this.graphics.drawRect(0, 0, 400, 20);
			this.graphics.endFill();
			
			//this.blendMode = BlendMode.INVERT;
			addChild(txt_report);
			txt_report.autoSize = TextFieldAutoSize.LEFT;
			
			var tf:TextFormat = new TextFormat();
			tf.font = "Arial";
			tf.size = 10;
			tf.color = 0xffffff;
			txt_report.defaultTextFormat = tf;
			
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.addEventListener(Event.ADDED, stage_added);
			
			addEventListener(Event.ENTER_FRAME, enter_frame);
		}
		
		private function stage_added(e:Event):void 
		{
			DepthUtil.toFront(this);
		}
		
		private function enter_frame(e:Event):void 
		{
			_timer = getTimer();
			
			if (_timer - 1000 > _ms_prev)
			{
				_ms_prev = _timer;
				_mem = Number((System.totalMemory * 0.000000954).toFixed(3));	
				
				txt_report.text = "";
				txt_report.appendText("fps: " + _fps + "/" + stage.frameRate.toString());
				txt_report.appendText(" , ");
				txt_report.appendText("memory: " + _mem.toString() + "mb");
				txt_report.appendText(" , ");
				txt_report.appendText("stage: " + stage.stageWidth + "/" + stage.stageHeight + "px");
				txt_report.appendText(" , ");
				txt_report.appendText("player: " + Capabilities.version);
				
				_fps = 0;
			}

			_fps++;
			
			
		}
		
	}

}