package com.geleca.as3.ui.component 
{
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.display.SimpleSprite;
	import com.geleca.as3.layout.Layout;
	import com.geleca.as3.util.ContainerUtil;
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.system.System;
	
	public class Component extends SimpleSprite
	{
		private var _enabled								:Boolean = true;
		private var _initialized							:Boolean = false;
		private var _components								:Vector.<Component> = new Vector.<Component>();
		private var _setup									:Boolean = false;
		public var layout									:Layout;
		private var _selected								:Boolean;
		private var _skinClass								:Class;
		public var skin										:Sprite;
		
		public function Component(skin:Class) 
		{
			_skinClass = skin;
			
			if (_skinClass)
			{
				this.skin = new _skinClass();
				addChild(this.skin);
			}
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
				
				removeChild(hit);
			}
			
			focusRect = false;
			
			addEventListener(FocusEvent.FOCUS_IN, 	_focusIn);
			addEventListener(FocusEvent.FOCUS_OUT, 	_focusOut);
		}
		
		protected function initialize():void 
		{
			
		}
		
		public final function initializeComponent():Component
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
		
		protected function addComponent(component:Component):*
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
		
		protected function removeComponent(component:Component):Component
		{
			var index:int = _components.indexOf(component);
			if (index != -1)
			{
				_components.splice(index, 1);
				component.destroy();
				removeChild(component);
			}
			
			return component;
		}
		
		private function initializeComponents():void 
		{
			for each (var comp:Component in _components) 
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
		
		override public function get hitArea():Sprite { return super.hitArea; }
		
		override  public function set hitArea(value:Sprite):void 
		{
			if (value)
			{
				addChild(value);
				super.hitArea = value;
			}
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
		
		public function get fullWidth()		:Number { return super.width; }
		public function get fullHeight()	:Number { return super.height; }
		
		override public function get width():Number { return (hitArea) ? hitArea.width : super.width; }
		
		override public function set width(value:Number):void 
		{
			if (hitArea)
				hitArea.width = value;
			else
				super.width = value;
		}
		
		override public function get height():Number { return (hitArea) ? hitArea.height : super.height; }
		
		override public function set height(value:Number):void 
		{
			if (hitArea)
				hitArea.height = value;
			else
				super.height = value;
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
		
		override public function destroy():void 
		{
			removeEventListener(FocusEvent.FOCUS_IN, 	_focusIn);
			removeEventListener(FocusEvent.FOCUS_OUT, 	_focusOut);
			
			for each (var comp:Component in _components) 
				removeComponent(comp);
			
			_components = null;
			
			if (this.parent)
				this.parent.removeChild(this);
			
			ContainerUtil.removeAllChilds(this, true);
			
			skin 		= null;
			_skinClass	= null;
			
			if (layout)
				layout.removeElement(this);
				
			layout 		= null;
			
			System.gc();
			
			super.destroy();
		}
		
		
	}

}