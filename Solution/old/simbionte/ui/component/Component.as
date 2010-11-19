package simbionte.ui.component 
{
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.system.System;
	import simbionte.core.IDestroyable;
	import simbionte.events.ComponentEvent;
	import simbionte.events.EventManager;
	import simbionte.events.StateEvent;
	import simbionte.utils.ContainerUtil;
	
	public class Component extends Sprite implements IDestroyable
	{
		public static const STATE_NORMAL						:String = "STATE_NORMAL";
		public static const STATE_SHOW							:String = "STATE_SHOW";
		public static const STATE_SHOW_COMPLETE					:String = "STATE_SHOW_COMPLETE";
		public static const STATE_HIDE							:String = "STATE_HIDE";
		public static const STATE_HIDE_COMPLETE					:String = "STATE_HIDE_COMPLETE";
		
		private var _enabled									:Boolean = true;
		private var _initialized								:Boolean = false;
		private var _state										:String = STATE_NORMAL;
		
		public function Component() 
		{
			
		}
		
		protected function setAssets():void 
		{
			
		}
		
		protected function setVariables():void 
		{
			focusRect = false;
		}
		
		protected function setListeners():void 
		{
			addEventListener(FocusEvent.FOCUS_IN, 	component_focusIn);
			addEventListener(FocusEvent.FOCUS_OUT, 	component_focusOut);
		}
		
		protected function initialize():void 
		{
			
		}
		
		public final function initializeComponent():void 
		{
			setAssets();
			setVariables();
			setListeners();
			initialize();
			_initialized = true;
			dispatchEvent(new ComponentEvent(ComponentEvent.INITIALIZED));
		}
		
		public function set enabled(value:Boolean):void 
		{
			if (value != _enabled)
			{
				_enabled = value;
				
				if (value) enable();
				else disable();
			}
		}
		
		public function get state():String { return _state; }
		
		public function set state(value:String):void 
		{
			if (value != _state && value != null)
			{
				dispatchEvent(new StateEvent(StateEvent.CHANGE, _state, value));
				
				_state = value;
			}
		}
		
		public final function get enabled()			:Boolean 	{ return _enabled; }
		public final function get initialized()		:Boolean 	{ return _initialized; }
		
		protected function enable():void 
		{
			mouseEnabled = mouseChildren = true;
		}
		
		protected function disable():void 
		{
			mouseEnabled = mouseChildren = false;
		}
		
		private function component_focusIn(e:FocusEvent):void 
		{
			focusIn();
		}
		
		private function component_focusOut(e:FocusEvent):void 
		{
			focusOut();
		}
		
		protected function focusIn():void 
		{
			
		}
		
		protected function focusOut():void 
		{
			
		}
		
		override public function set hitArea(value:Sprite):void 
		{
			if (value)
			{
				if (value.parent != this) addChild(value);
			}
			
			super.hitArea = value;
		}
		
		override public function get hitArea():Sprite {return super.hitArea}
		
		public function show(onComplete:Function=null):void 
		{
			
		}
		
		protected function show_complete():void 
		{
			
		}
		
		public function hide(onComplete:Function=null):void 
		{
			
		}
		
		protected function hide_complete():void 
		{
			
		}
		
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void 
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
			EventManager.addEventListener(this, type, listener, useCapture, priority, useWeakReference, false);
		}
		
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void 
		{
			super.removeEventListener(type, listener, useCapture);
			EventManager.removeEventListener(this, type, listener, useCapture,false);
		}
		
		public function move(x:Number, y:Number):void 
		{
			this.x = x;
			this.y = y;
		}
		
		public function resize(width:Number, height:Number):void 
		{
			this.width 	= width;
			this.height = height;
		}
		
		override public function get width():Number { return (hitArea) ? hitArea.width : super.width; }
		
		override public function set width(value:Number):void 
		{
			if (hitArea) hitArea.width = value;
			else super.width = value;
		}
		
		override public function get height():Number { return (hitArea) ? hitArea.height : super.height; }
		
		override public function set height(value:Number):void 
		{
			if (hitArea) hitArea.height = value;
			else super.height = value;
		}
		
		public function destroy():void 
		{			
			hitArea = null;
			mask 	= null;
			
			EventManager.removeAllListeners(this);
			
			ContainerUtil.removeAllChilds(this);
			
			System.gc();
		}
	}

}