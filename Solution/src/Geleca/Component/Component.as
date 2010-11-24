package Geleca.Component 
{
	import flash.display.Sprite;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.FocusEvent;
	import flash.system.System;
	import Geleca.Display.HitArea;
	import Geleca.Events.SimpleEventDispatcher;
	import Geleca.Events.StateEvent;
	import Geleca.Util.ContainerUtil;
	
	public class Component extends SimpleEventDispatcher
	{
		private var _enabled								:Boolean = true;
		private var _initialized							:Boolean = false;
		
		protected var _asset								:Sprite;
		private var _hitArea								:HitArea;
		
		private var _components								:Vector.<Component> = new Vector.<Component>();
		
		public function Component(asset:Sprite) 
		{
			_asset = asset;
		}
		
		protected function setAssets():void 
		{
			if (_asset.getChildByName("sp_hitArea"))
			{
				var hit:Sprite = Sprite(_asset.getChildByName("sp_hitArea"));
				hitArea = new HitArea(hit.width, hit.height);
				
				_asset.removeChild(hit);
			}
		}
		
		protected function setComponents():void 
		{
			
		}
		
		protected function setVariables():void 
		{
			_asset.focusRect = false;
		}
		
		protected function setListeners():void 
		{
			_asset.addEventListener(FocusEvent.FOCUS_IN, 	asset_focusIn);
			_asset.addEventListener(FocusEvent.FOCUS_OUT, 	asset_focusOut);
		}
		
		protected function initialize():void 
		{
			
		}
		
		public final function initializeComponent():Component
		{
			setAssets();
			setComponents();
			setVariables();
			setListeners();
			initializeComponents();
			initialize();
			_initialized = true;
			
			return this;
			//dispatchEvent(new ComponentEvent(ComponentEvent.INITIALIZED));
		}
		
		protected function addComponent(component:Component):Component
		{
			if (_components.indexOf(component) == -1)
				_components.push(component);
				
			return component;
		}
		
		protected function initializeComponents():void 
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
				
				if (value) enable();
				else disable();
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
		
		override public function destroy():void 
		{
			_asset.removeEventListener(FocusEvent.FOCUS_IN, 	asset_focusIn);
			_asset.removeEventListener(FocusEvent.FOCUS_OUT, 	asset_focusOut);
			
			for each (var comp:Component in _components) 
			{
				comp.destroy();
			}
			
			_components = null;
			
			if (_asset.parent)
				_asset.parent.removeChild(_asset);
			
			ContainerUtil.removeAllChilds(_asset);
			
			_asset 		= null;
			_hitArea 	= null;
			
			System.gc();
			
			super.destroy();
		}
	}
}