package Geleca.Layout 
{
	import com.adobe.utils.ArrayUtil;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.system.System;
	import flash.utils.Dictionary;
	import Geleca.Util.AlignUtil;
	import Geleca.Events.SimpleEventDispatcher;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Layout extends SimpleEventDispatcher
	{	
		private var _container   		:DisplayObjectContainer;
		private var _stage				:Stage;
		private var _elements    		:Dictionary = new Dictionary();
		
		private var _lastStageWidth		:Number = 0;
		private var _lastStageHeight	:Number = 0;
		
		/**
		 * 
		 * @param container Container utilizado para alocar os elementos do controle, pode ser tanto um container Stage quanto Sprite
		 */
		public function Layout(stage:Stage=null) 
		{
			this.stage = stage;
		}
		
		/**
		 * @return O container do controle.
		 */
		//public function get container()      :DisplayObjectContainer { return _container; }
		protected function get containerWidth() :int
		{ 
			return stage.stageWidth;
		}
		protected function get containerHeight():int
		{ 
			return stage.stageHeight;
		}
		
		public function get stage():Stage { return _stage; }
		
		public function set stage(value:Stage):void 
		{
			if (value != null && value != stage)
			{
				_stage = value;
				stage.addEventListener(Event.RESIZE, 	stage_resize);
				stage.addEventListener(Event.ADDED, 	stage_resize);
			}
		}
		
		private function stage_resize(e:Event):void 
		{
			if(_lastStageWidth != stage.stageWidth || _lastStageHeight != stage.stageHeight)
			{
				render();
				
				_lastStageWidth 	= stage.stageWidth;
				_lastStageHeight 	= stage.stageHeight;
			}
		}
		
		//public function get elements():Array { return _elements; }
		
		public function addElement(target:Object, settings:LayoutSettings):void 
		{
			_elements[target] = settings;
		}
		
		public function render():void 
		{
			for (var key:Object in _elements) 
			{
				renderElement(key);
			}
			
			dispatchEvent(new Event(Event.RENDER));
		}
		
		public function renderElement(element:Object):void 
		{
			var settings	:LayoutSettings = _elements[element];
			var percent		:int = 0;
			
			//**********************************************************
			//width
			if (settings.width != null)
			{
				if (String(settings.width).indexOf("%") != -1) //verifica se a largura é em percentual 
				{
					percent             = int(String(settings.width).replace("%", ""));
					element.width  		= containerWidth * (percent / 100);
				}
				else //caso seja fixa
					element.width = Number(settings.width);
			}
			
			//**********************************************************
			//height
			if (settings.height != null)
			{
				if (String(settings.height).indexOf("%") != -1) //verifica se a altura é em percentual 
				{
					percent             = int(String(settings.height).replace("%", ""));
					element.height 		= containerHeight * (percent / 100);
				}
				else //caso seja fixa
					element.height = Number(settings.height);
			}
			
			//**********************************************************
			//horizontalAlignment
			switch (settings.horizontalAlignment) 
			{
				case LayoutSettings.LEFT:
					element.x = 0;
				break;
				
				case LayoutSettings.RIGHT:
					AlignUtil.toRightStage(element);
				break;
				
				case LayoutSettings.CENTER:
					AlignUtil.toCenterStage(element);
				break;
			}
			
			//**********************************************************
			//verticalAlignment
			switch (settings.verticalAlignment) 
			{
				case LayoutSettings.TOP:
					element.y = 0;
				break;
				
				case LayoutSettings.BOTTOM:
					AlignUtil.toBottomStage(element);
				break;
				
				case LayoutSettings.MIDDLE:
					AlignUtil.toMiddleStage(element);
				break;
			}
			
			//**********************************************************
			//margin
			if (settings.margin != null) 
			{
				element.y += settings.margin.top; //top
				element.x -= settings.margin.right; //right
				element.y -= settings.margin.bottom; //bottom
				element.x += settings.margin.left; //left
			}
			
			//**********************************************************
			//margin
			if (settings.minX != null) 
				if (element.x < settings.minX)
					element.x = Number(settings.minX);
				
			if (settings.maxX != null) 
				if (element.x > settings.maxX)
					element.x = Number(settings.maxX);
			
			if (settings.minY != null) 
				if (element.y < settings.minY)
					element.y = Number(settings.minY);
			
			if (settings.maxY != null) 
				if (element.y > settings.maxY)
					element.y = Number(settings.maxY);
		}
		
		public function removeElement(element:Object):void 
		{
			_elements[element] = null;
			delete _elements[element];
			System.gc();
		}
		
		override public function destroy():void 
		{
			for (var element:Object in _elements) 
			{
				removeElement(element);
			}
			
			stage.removeEventListener(Event.RESIZE, 	stage_resize);
			stage.removeEventListener(Event.ADDED, 		stage_resize);
			
			_elements	= null;
			stage		= null;
			
			super.destroy();
		}
		
	}

}