package com.geleca.as3.mvc.core
{
	import com.geleca.as3.events.SimpleEventDispatcher;
	import com.geleca.as3.loading.CallBackLoaderItem;
	import com.geleca.as3.loading.GLoader;
	import com.geleca.as3.loading.ViewLoaderItem;
	import com.geleca.as3.util.DictionaryUtil;
	import com.geleca.as3.util.ObjectUtil;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.utils.Dictionary;
	
	public class Controller extends SimpleEventDispatcher
	{
		//private var _view							:View;
		public var app								:MVCApp;
		private var _loader							:GLoader;
		
		public var action							:RouteAction;
		
		private var _viewData						:Dictionary = new Dictionary();
		
		//update view ao invez de add
		//private var _update							:Boolean;
		
		public function Controller()
		{
			_loader = new GLoader();
		}
		
		/*public function load():void 
		{
			_loader.addLoaderItem(new CallBackLoaderItem(controller_execAction));
			_loader.addLoaderItem(new ViewLoaderItem("view", _view));
			
			//Priority 100 para que o loader_complete execute antes de qualquer outro listener
			_loader.addEventListener(ProgressEvent.PROGRESS, 	loader_progressEvent);
			_loader.addEventListener(Event.COMPLETE, 			loader_complete, false, 100);
			
			_loader.load();
		}*/
		
		/*private function loader_progressEvent(e:ProgressEvent):void 
		{
			loader_progress(loader.progress);
		}
		
		private function loader_complete(e:Event):void 
		{
			_loader.removeEventListener(Event.COMPLETE, loader_complete);
			load_complete();
		}*/
		
		/*protected function loader_progress(progress:Number):void 
		{
			
		}
		
		protected function load_complete():void 
		{
			
		}*/
		
		/*private function controller_execAction(item:CallBackLoaderItem):void
		{
			this.addEventListener(Event.COMPLETE, controller_actionComplete);
			this[act.action].call();
			
			function controller_actionComplete():void 
			{
				item.finish();
			}
			
		}*/
		
		/*protected function actionComplete():void 
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}*/
		
		protected function setup():void 
		{
			
		}
		
		protected function initialize():void 
		{
			
		}
		
		public function initializeController():void 
		{
			setup();
			initialize();
		}
		
		//public function get view():View { return _view; }
		
		/*public function set view(value:Class):void 
		{
			var view:View;
			
			if (app.view.viewRender.getCurrent() is value)
			{
				view = app.view.viewRender.getCurrent();
				view.loader.removeAll();
				_update = true;
			}
			else
				view = new value();
			
			//view = new value();
			_view 		= view;
			_view.app 	= app;
			
			//DictionaryUtil.clear(viewData);
		}*/
		
		public function get loader():GLoader { return _loader; }
		
		public function get viewData():Dictionary { return _viewData; }
		
		/*public final function render(onComplete:Function=null):void 
		{
			/*app.view.viewRender.swap(_view);
			_view.action(act.action);
			this.destroy();*/
			
			//this.destroy();
			
			/*//Loading Controller
			_loader.addEventListener(Event.COMPLETE, loader_complete);
			_loader.load();
			
			function loader_complete(e:Event):void
			{
				_loader.removeEventListener(Event.COMPLETE, loader_complete);
			}
			
			//Loading View
			_view.loader.addEventListener(Event.COMPLETE, viewLoader_complete);
			_view.load();
			
			function viewLoader_complete(e:Event):void 
			{
				_view.loader.removeEventListener(Event.COMPLETE, viewLoader_complete);
				
				if (onComplete != null)
					onComplete();
				
				if (!_update)
					app.masterview.switcher.swap(_view);
					
				_view.action(act.action);
			}
		}*/
		
		/*public function getView():View
		{
			return _view;
		}*/
		
		override public function destroy():void 
		{
			super.destroy();
			
			_loader.destroy();
			
			/*_view 		= null;
			app 		= null;
			_loader 	= null;
			act 		= null;
			parameters 	= null;
			post 		= null;*/
		}
	}
}