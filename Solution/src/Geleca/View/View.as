package Geleca.View
{
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.FocusEvent;
	import flash.system.System;
	import flash.utils.Dictionary;
	import Geleca.Component.Component;
	import Geleca.Core.IDestroyable;
	import Geleca.Display.HitArea;
	import Geleca.Events.SimpleEventDispatcher;
	import Geleca.Events.StateEvent;
	import Geleca.Util.ContainerUtil;
	
	public class View extends Sprite implements IDestroyable
	{
		private var _enabled								:Boolean = true;
		private var _initialized							:Boolean = false;
		
		private var _components								:Vector.<Component> = new Vector.<Component>();
		private var _views									:Vector.<View> = new Vector.<View>();
		
		public function View() 
		{
			
		}
		
		protected function setAssets():void 
		{
			if (this.getChildByName("sp_hitArea"))
			{
				var hit:Sprite = Sprite(this.getChildByName("sp_hitArea"));
				hitArea = new HitArea(hit.width, hit.height);
				
				this.removeChild(hit);
			}
		}
		
		protected function setViews():void 
		{
			
		}
		
		protected function setComponents():void 
		{
			
		}
		
		protected function setVariables():void 
		{
			this.focusRect = false;
		}
		
		protected function setListeners():void 
		{
			
		}
		
		protected function initializeViews():void 
		{
			for each (var view:View in _views) 
			{
				view.initializeView();
			}
		}
		
		protected function initializeComponents():void 
		{
			for each (var comp:Component in _components) 
			{
				comp.initializeComponent();
			}
		}
		
		protected function initialize():void 
		{
			
		}
		
		public final function initializeView():View 
		{
			setAssets();
			setViews();
			setComponents();
			setVariables();
			setListeners();
			initializeViews();
			initializeComponents();
			initialize();
			_initialized = true;			
			
			return this;
		}
		
		public function show(onComplete:Function=null):void 
		{
			
		}
		
		public function hide(onComplete:Function=null):void 
		{
			
		}
		
		protected function addView(view:View):View 
		{
			if (_views.indexOf(view) == -1)
			{
				_views.push(view);
				addChild(view);
			}
			
			if (this.initialized && !view.initialized)
				view.initializeView();
				
			return view;
		}
		
		protected function removeView(view:View):View
		{
			var index:int = _views.indexOf(view);
			if (index != -1)
			{
				_views.splice(index, 1);
				if (view.parent == this)
					removeChild(view);
				view.destroy();
			}
			
			return view;
		}
		
		protected function addComponent(component:Component):Component
		{
			if (_components.indexOf(component) == -1)
				_components.push(component);
				
			return component;
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
		
		public function get enabled()			:Boolean 	{ return _enabled; }
		public function get initialized()		:Boolean 	{ return _initialized; }
		
		override public function set hitArea(value:Sprite):void 
		{
			if (value && value.parent != this)
			{
				this.addChild(value);
				super.hitArea = value;
			}
		}
		
		protected function enable():void 
		{
			this.mouseEnabled = this.mouseChildren = true;
		}
		
		protected function disable():void 
		{
			this.mouseEnabled = this.mouseChildren = false;
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
		
		public function destroy():void 
		{
			if (hitArea)
				this.removeChild(hitArea);
				
			for each (var view:View in _views) 
			{
				view.destroy();
			}
			
			for each (var comp:Component in _components) 
			{
				comp.destroy();
			}
			
			_views = null;
			_components = null;
			
			ContainerUtil.removeAllChilds(this);
			
			System.gc();
		}
	}

}