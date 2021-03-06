package com.geleca.as3.ui.component 
{
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.display.SimpleSprite;
	import com.geleca.as3.events.StateEvent;
	import com.geleca.as3.layout.Layout;
	import com.geleca.as3.util.ContainerUtil;
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.system.System;
	
	public class UIComponent extends SimpleSprite
	{
		private var _enabled								:Boolean = true;
		private var _initialized							:Boolean = false;
		private var _components								:Vector.<UIComponent> = new Vector.<UIComponent>();
		private var _setup									:Boolean = false;
		private var _selected								:Boolean;
		private var _skinClass								:Class;
		private var _state									:String = "";
		
		protected var self									:UIComponent;
		
		public var layout									:Layout;
		public var skin										:Sprite;
		
		public function UIComponent(skin:Class=null) 
		{
			super();
			
			_skinClass = skin;
			
			if (_skinClass)
			{
				this.skin = new _skinClass();
				addChild(this.skin);
			}
			
			self = this;
		}
		
		protected function setup():void 
		{
			if (_setup)
				return;
				
			_setup = true;
			
			if (skin && skin.getChildByName("sp_hitArea"))
			{
				//skin.mouseEnabled = skin.mouseChildren = false;
				var hit:Sprite = Sprite(skin.getChildByName("sp_hitArea"));
				hitArea = new HitArea(hit.width, hit.height);
				hitArea.x = hit.x;
				hitArea.y = hit.y;
				
				skin.removeChild(hit);
			}
			
			focusRect = false;
			
			addEventListener(FocusEvent.FOCUS_IN, 	_focusIn);
			addEventListener(FocusEvent.FOCUS_OUT, 	_focusOut);
		}
		
		protected function initialize():void 
		{
			
		}
		
		public final function initializeComponent():UIComponent
		{
			if (_initialized)
				return this;
				
			if(!_setup)
				setup();
				
			initializeComponents();
			initialize();
			_initialized = true;
			
			return this;
			//dispatchEvent(new ComponentEvent(ComponentEvent.INITIALIZED));
		}
		
		public function forceSetup():void 
		{
			if(!_setup)
				setup();
		}
		
		protected function addComponent(component:UIComponent):*
		{
			if (_components.indexOf(component) == -1)
			{
				_components.push(component);
				component.layout = this.layout;
				addChild(component);
				component.forceSetup();
			}
				
			return component;
		}
		
		protected function removeComponent(component:UIComponent):UIComponent
		{
			var index:int = _components.indexOf(component);
			if (index != -1)
			{
				_components.splice(index, 1);
				component.destroy();
				//removeChild(component);
			}
			
			return component;
		}
		
		private function initializeComponents():void 
		{
			for each (var comp:UIComponent in _components) 
				comp.initializeComponent();
		}
		
		public function set enabled(value:Boolean):void 
		{
			if (value != _enabled)
			{
				_enabled = value;
				
				if (value)
					enable();
				else
					disable();
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
		
		private function _focusIn(e:FocusEvent):void 
		{
			focusIn();
		}
		
		private function _focusOut(e:FocusEvent):void 
		{
			focusOut();
		}
		
		protected function focusIn():void 
		{
			
		}
		
		protected function focusOut():void 
		{
			
		}
		
		protected function select():void 
		{
			
		}
		
		protected function unselect():void 
		{
			
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
		
		public function get selected():Boolean { return _selected; }
		
		public function set selected(value:Boolean):void 
		{
			if (value != _selected)
			{
				_selected = value;
				
				if (_selected)
					select();
				else
					unselect();
			}
		}
		
		public function get state():String 
		{
			return _state;
		}
		
		public function set state(value:String):void 
		{
			var oldState:String = _state;
			var newState:String = value;
			
			if (oldState == newState)
				return;
			
			_state = newState;
			state_change(oldState, newState);
			dispatchEvent(new StateEvent(StateEvent.CHANGE, oldState, newState));
		}
		
		protected function state_change(oldState:String, newState:String):void 
		{
			
		}
		
		override public function destroy():void 
		{
			removeEventListener(FocusEvent.FOCUS_IN, 	_focusIn);
			removeEventListener(FocusEvent.FOCUS_OUT, 	_focusOut);
			
			for each (var comp:UIComponent in _components) 
				removeComponent(comp);
			
			_components = null;
			
			if (this.parent)
				this.parent.removeChild(this);
			
			ContainerUtil.removeAllChilds(this);
			
			skin 		= null;
			_skinClass	= null;
			
			if (layout)
				layout.removeElement(this);
				
			layout 		= null;
			
			self		= null;
			
			System.gc();
			
			super.destroy();
		}
		
		
	}

}