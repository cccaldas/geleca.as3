package com.geleca.as3.view
{
	import com.geleca.as3.core.IDestroyable;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.events.SimpleEventDispatcher;
	import com.geleca.as3.events.StateEvent;
	import com.geleca.as3.i18n.Lang;
	import com.geleca.as3.loading.GLoader;
	import com.geleca.as3.loading.LoaderItem;
	import com.geleca.as3.ui.component.UIComponent;
	import com.geleca.as3.util.ContainerUtil;
	import com.geleca.as3.util.DictionaryUtil;
	
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.ProgressEvent;
	import flash.system.System;
	import flash.utils.Dictionary;
	import com.geleca.as3.component.IComponent;
	import flash.display.DisplayObject;
	import com.geleca.as3.layout.Layout;

	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class View extends Sprite implements IDestroyable
	{
		private var _enabled								:Boolean = true;
		private var _initialized							:Boolean = false;
		
		private var _components								:Vector.<IComponent> = new Vector.<IComponent>();
		private var _views									:Vector.<View> 		= new Vector.<View>();
		
		private var _loader									:GLoader = new GLoader();
		
		private var _loaded									:Boolean;
		private var _setup									:Boolean;
		
		//private var _switcher								:ViewSwitcher;
		
		protected var self									:View;
		public var layout									:Layout;
		//protected var lang									:Lang;
		
		public function View() 
		{
			super();
			
			this.self = this;
		}
		
		public function load():void 
		{
			//setup();
			_loader.addEventListener(Event.COMPLETE, _loader_complete, false, 100);
			_loader.load();
		}
		
		private function _loader_complete(e:Event):void
		{
			_loaded = true;
			
			dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS));
			
			//i18n
			//GLog.log("lang", _loader.getItem("lang"));
			
			/*if(_loader.getItem("lang") != null)
				lang = _loader.getItem("lang");*/
			
			//_loader.addEventListener(Event.INIT, 					dispatchEvent);
			_loader.removeEventListener(ProgressEvent.PROGRESS, 	dispatchEvent);
			_loader.removeEventListener(Event.COMPLETE, 			_loader_complete);
			loader_complete();
			dispatchEvent(e);
		}
		
		protected function loader_complete():void 
		{
			
		}
		
		public function setup():void 
		{
			this.focusRect = false;
			
			//_loader.addEventListener(Event.INIT, 				dispatchEvent);
			//_loader.addEventListener(ProgressEvent.PROGRESS, 	dispatchEvent);
			
			//_setup = true;
		}
		
		protected function initialize():void 
		{
			
		}
		
		public final function initializeView():View 
		{
			setup();
			initializeComponents();
			initializeViews();
			initialize();
			
			return this;
		}
		
		protected function addLoaderItem(item:LoaderItem):void 
		{
			_loader.addLoaderItem(item);
		}
		
		protected function getLoaderItem(id:String):*
		{
			return _loader.getItem(id);
		}
		
		private function initializeViews():void 
		{
			for each (var view:View in _views) 
				view.initializeView();
		}
		
		private function initializeComponents():void 
		{
			for each (var comp:IComponent in _components) 
			{
				comp.initializeComponent();
			}
		}	
		
		private function _initialize():void 
		{
			initializeViews();
			initializeComponents();
			_initialized = true;
			initialize();
		}
		
		public function show(onComplete:Function=null):void 
		{
			if (onComplete != null)
				onComplete();
		}
		
		public function hide(onComplete:Function=null):void 
		{
			if (onComplete != null)
				onComplete();
		}
		
		protected function addView(view:View):* 
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
		
		protected function removeView(view:View):*
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
		
		protected function addComponent(component:IComponent):*
		{
			if (_components.indexOf(component) == -1)
			{
				_components.push(component);
				component.layout = self.layout;
				
				if(component is DisplayObject)
					addChild(DisplayObject(component));
					
				component.setup();
			}
				
			if (this.initialized && !component.initialized)
				component.initializeComponent();
				
			return component;
		}
		
		protected function removeComponent(component:IComponent):IComponent
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
		
		public function get loader():GLoader { return _loader; }
		
		public function get loaded():Boolean { return _loaded; }
		
		//public function get switcher():ViewSwitcher { return _switcher; }
		
		/*public function set switcher(value:ViewSwitcher):void 
		{
			_switcher = value;
		}*/
		
		public function destroy():void 
		{
			_loader.destroy();
			_loader = null;
			
			if (hitArea)
				this.removeChild(hitArea);
				
			for each (var view:View in _views) 
				view.destroy();
			
			for each (var comp:IComponent in _components) 
				comp.destroy();
			
			_views 			= null;
			_components 	= null;
			//_switcher 		= null;
			this.self 		= null;
			
			ContainerUtil.removeAllChilds(this);
			
			if (parent)
				parent.removeChild(this);
			
			System.gc();
		}
	}

}