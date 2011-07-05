package com.geleca.as3.component 
{
	import com.geleca.as3.layout.Layout;
	import flash.display.Sprite;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.FocusEvent;
	import flash.geom.Rectangle;
	import flash.system.System;
	import com.geleca.as3.asset.AssetNav;
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.events.SimpleEventDispatcher;
	import com.geleca.as3.events.StateEvent;
	import com.geleca.as3.util.ContainerUtil;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Component extends SimpleEventDispatcher
	{
		private var _enabled								:Boolean = true;
		private var _initialized							:Boolean = false;
		
		public var _asset									:Sprite;
		protected var _nav									:AssetNav;
		private var _hitArea								:HitArea;
		
		private var _components								:Vector.<Component> = new Vector.<Component>();
		
		private var _setup									:Boolean = false;
		
		public var layout									:Layout;
		
		private var _selected								:Boolean;
		
		private var _parent									:Component;
		
		public function Component(asset:Sprite) 
		{
			_asset 	= asset;
			_nav 	= new AssetNav(asset);
		}
		
		protected function setup():void 
		{
			if (_setup)
				return;
				
			_setup = true;
				
			//trace(_asset.name, "setup:", _setup);
				
			if (_asset.getChildByName("sp_hitArea"))
			{
				var hit:Sprite = Sprite(_asset.getChildByName("sp_hitArea"));
				hitArea = new HitArea(hit.width, hit.height);
				hitArea.x = hit.x;
				hitArea.y = hit.y;
				
				hit.parent.removeChild(hit);
				//_asset.removeChild(hit);
			}
			
			_asset.focusRect = false;
			
			_asset.addEventListener(FocusEvent.FOCUS_IN, 	asset_focusIn);
			_asset.addEventListener(FocusEvent.FOCUS_OUT, 	asset_focusOut);
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
		
		//TEST: fazer setup sempre que o componente for adicionado dentro de uma view ou dentro de um component
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
				component.parent = this;
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
			}
			
			return component;
		}
		
		private function initializeComponents():void 
		{
			for each (var comp:Component in _components) 
			{
				comp.initializeComponent();
			}
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
				_asset.addChild(value);
				_asset.hitArea = value;
				_hitArea = value;
			}
		}
		
		protected function enable():void 
		{
			_asset.mouseEnabled = _asset.mouseChildren = true;
		}
		
		protected function disable():void 
		{
			_asset.mouseEnabled = _asset.mouseChildren = false;
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
		
		public function get x():Number { return _asset.x; }
		
		public function set x(value:Number):void 
		{
			_asset.x = value;
		}
		
		public function get y():Number { return _asset.y; }
		
		public function set y(value:Number):void 
		{
			_asset.y = value;
		}
		
		public function get alpha():Number { return _asset.alpha; }
		public function set alpha(value:Number):void 
		{
			_asset.alpha = value;
		}
		
		public function get width():Number { return (hitArea) ? hitArea.width : _asset.width; }
		
		public function set width(value:Number):void 
		{
			if (hitArea)
				hitArea.width = value;
			else
				_asset.width = value;
			
		}
		
		public function get height():Number { return (hitArea) ? hitArea.height : _asset.height; }
		
		public function set height(value:Number):void 
		{
			if (hitArea)
				hitArea.height = value;
			else
				_asset.height = value;
		}
		
		public function set tabIndex(value:int):void 
		{
			_asset.tabIndex = value;
		}
		
		public function get tabIndex():int { return _asset.tabIndex; }
		
		public function get stage()			:Stage 			{ return _asset.stage; }
		public function get loaderInfo()	:LoaderInfo 	{ return _asset.loaderInfo; }
		
		public function set visible(value:Boolean):void 
		{
			_asset.visible = value;
		}
		
		public function get visible():Boolean { return _asset.visible; }
		
		public function startDrag(lockCenter:Boolean=false, bounds:Rectangle=null):void
		{
			_asset.startDrag(lockCenter, bounds);
		}
		
		public function stopDrag():void 
		{
			_asset.stopDrag();
		}
		
		public function set buttonMode(value:Boolean):void 
		{
			_asset.buttonMode = value;
		}
		
		public function get buttonMode():Boolean { return _asset.buttonMode; }
		
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
		
		public function get parent():Component { return _parent; }
		
		public function set parent(value:Component):void 
		{
			_parent = value;
		}
		
		protected function select():void 
		{
			
		}
		
		protected function unselect():void 
		{
			
		}
		
		override public function destroy():void 
		{
			_asset.removeEventListener(FocusEvent.FOCUS_IN, 	asset_focusIn);
			_asset.removeEventListener(FocusEvent.FOCUS_OUT, 	asset_focusOut);
			
			for each (var comp:Component in _components) 
			{
				removeComponent(comp);
			}
			
			_components = null;
			
			if (_asset.parent)
				_asset.parent.removeChild(_asset);
			
			ContainerUtil.removeAllChilds(_asset);
			
			_nav.destroy();
			_nav = null;
			
			_asset 		= null;
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