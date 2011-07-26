package com.geleca.as3.component 
{
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.events.SimpleEventDispatcher;
	import com.geleca.as3.events.StateEvent;
	import com.geleca.as3.layout.Layout;
	import com.geleca.as3.util.ContainerUtil;
	
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.FocusEvent;
	import flash.geom.Rectangle;
	import flash.system.System;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Component extends SimpleEventDispatcher implements IComponent
	{
		private var _enabled								:Boolean = true;
		private var _initialized							:Boolean = false;
		
		public var asset									:Sprite;
		private var _hitArea								:HitArea;
		
		private var _components								:Vector.<IComponent> = new Vector.<IComponent>();
		
		private var _setup									:Boolean = false;
		
		private var _selected								:Boolean;
		
		private var _parent									:IComponent;
		private var _layout									:Layout;
		
		private var _state									:String;
		
		protected var self									:Component;
		
		public function Component(asset:Sprite) 
		{
			this.asset 	= asset;
			this.self 	= this;
		}
		
		public function setup():void 
		{
			if (_setup)
				return;
				
			_setup = true;
				
			if (asset.getChildByName("sp_hitArea"))
			{
				var hit:Sprite = Sprite(asset.getChildByName("sp_hitArea"));
				hitArea = new HitArea(hit.width, hit.height);
				hitArea.x = hit.x;
				hitArea.y = hit.y;
				
				hit.parent.removeChild(hit);
			}
			
			asset.focusRect = false;
			
			asset.addEventListener(FocusEvent.FOCUS_IN, 	asset_focusIn);
			asset.addEventListener(FocusEvent.FOCUS_OUT, 	asset_focusOut);
		}
		
		public function init():void 
		{
			
		}
		
		public final function initializeComponent():IComponent
		{
			if (_initialized)
				return this;
				
			if(!_setup)
				setup();
				
			initializeComponents();
			init();
			_initialized = true;
			
			return this;
			//dispatchEvent(new ComponentEvent(ComponentEvent.INITIALIZED));
		}
		
		public function addComponent(component:IComponent):IComponent
		{
			if (_components.indexOf(component) == -1)
			{
				_components.push(component);
				component.layout = this.layout;
				component.parent = this;
				component.setup();
			}
				
			return component;
		}
		
		public function removeComponent(component:IComponent):IComponent
		{
			var index:int = _components.indexOf(component);
			if (index != -1)
			{
				_components.splice(index, 1);
				component.destroy();
			}
			
			return component;
		}
		
		private function initializeComponents():void 
		{
			for each (var comp:IComponent in _components) 
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
		
		public function get hitArea():HitArea { return _hitArea; }
		
		public function set hitArea(value:HitArea):void 
		{
			if (value)
			{
				asset.addChild(value);
				asset.hitArea = value;
				_hitArea = value;
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
		
		protected function enable():void 
		{
			asset.mouseEnabled = asset.mouseChildren = true;
		}
		
		protected function disable():void 
		{
			asset.mouseEnabled = asset.mouseChildren = false;
		}
		
		private function asset_focusIn(e:FocusEvent):void 
		{
			focusIn();
		}
		
		private function asset_focusOut(e:FocusEvent):void 
		{
			focusOut();
		}
		
		protected function focusIn():void 
		{
			
		}
		
		protected function focusOut():void 
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
		
		public function get x():Number { return asset.x; }
		
		public function set x(value:Number):void 
		{
			asset.x = value;
		}
		
		public function get y():Number { return asset.y; }
		
		public function set y(value:Number):void 
		{
			asset.y = value;
		}
		
		public function get alpha():Number { return asset.alpha; }
		public function set alpha(value:Number):void 
		{
			asset.alpha = value;
		}
		
		public function get width():Number { return (hitArea) ? hitArea.width : asset.width; }
		
		public function set width(value:Number):void 
		{
			if (hitArea)
				hitArea.width = value;
			else
				asset.width = value;
		}
		
		public function get height():Number { return (hitArea) ? hitArea.height : asset.height; }
		
		public function set height(value:Number):void 
		{
			if (hitArea)
				hitArea.height = value;
			else
				asset.height = value;
		}
		
		public function set tabIndex(value:int):void 
		{
			asset.tabIndex = value;
		}
		
		public function get tabIndex():int { return asset.tabIndex; }
		
		public function get stage()			:Stage 			{ return asset.stage; }
		public function get loaderInfo()	:LoaderInfo 	{ return asset.loaderInfo; }
		
		public function set visible(value:Boolean):void 
		{
			asset.visible = value;
		}
		
		public function get visible():Boolean { return asset.visible; }
		
		public function startDrag(lockCenter:Boolean=false, bounds:Rectangle=null):void
		{
			asset.startDrag(lockCenter, bounds);
		}
		
		public function stopDrag():void 
		{
			asset.stopDrag();
		}
		
		public function set buttonMode(value:Boolean):void 
		{
			asset.buttonMode = value;
		}
		
		public function get buttonMode():Boolean { return asset.buttonMode; }
		
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
		
		public function get parent():IComponent { return _parent; }
		
		public function set parent(value:IComponent):void 
		{
			_parent = value;
		}
		
		protected function select():void 
		{
			
		}
		
		protected function unselect():void 
		{
			
		}
		
		public function get layout():Layout
		{
			return _layout;
		}
		
		public function set layout(value:Layout):void
		{
			_layout = value;
		}
		
		override public function destroy():void 
		{
			asset.removeEventListener(FocusEvent.FOCUS_IN, 	asset_focusIn);
			asset.removeEventListener(FocusEvent.FOCUS_OUT, 	asset_focusOut);
			
			for each (var comp:IComponent in _components) 
				removeComponent(comp);			
			
			_components = null;
			
			if (asset.parent)
				asset.parent.removeChild(asset);
			
			ContainerUtil.removeAllChilds(asset);
			
			asset 		= null;
			_hitArea 	= null;
			_parent		= null;
			
			if (layout)
				layout.removeElement(this);
				
			layout 		= null;
			
			System.gc();
			
			super.destroy();
		}

	}
}