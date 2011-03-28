package com.geleca.as3.mvc.core
{
	import com.asual.swfaddress.SWFAddress;
	import com.geleca.as3.configuration.FlashConfig;
	import com.geleca.as3.core.BusyManager;
	import com.geleca.as3.core.Context;
	import com.geleca.as3.core.CursorManager;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.events.SimpleEventDispatcher;
	import com.geleca.as3.layout.Layout;
	import com.geleca.as3.loading.GLoader;
	import com.geleca.as3.loading.ViewLoaderItem;
	import com.geleca.as3.mvc.util.MVCAppBrowser;
	import flash.display.Stage;
	import flash.events.ProgressEvent;
	import nl.demonsters.debugger.MonsterDebugger;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class MVCApp extends SimpleEventDispatcher
	{
		public var router							:Router;
		private var _loader							:GLoader = new GLoader();
		
		private var _configURL						:String;
		
		public var config							:FlashConfig = new FlashConfig();
		public var context							:Context = new Context();
		
		public var post								:Object;
		
		private var _container						:Sprite;
		
		private var _preloader						:AbstractPreloaderView;
		private var _view							:AbstractAppView;
		
		public var layout							:Layout;
		public var busyManager						:BusyManager;
		public var cursorManager					:CursorManager;
		
		private var _loaded							:Boolean = false;
		
		private var _browser						:MVCAppBrowser;
		
		private var _tracker						:ITracker;
		
		public function MVCApp()
		{
			
		}
		
		public function startup(container:Sprite, preloader:AbstractPreloaderView, view:AbstractAppView, router:Router, tracker:ITracker=null, config:String="flash-config.xml"):void
		{
			_container 	= container;
			_preloader 	= preloader;
			_view		= view;
			
			_preloader.app 	= this;
			_view.app 		= this;
			
			this.router 	= router;
			
			router.app 		= this;
			
			_tracker		= tracker;
			_configURL 		= config;
			
			this.layout 		= new Layout(_container.stage);
			this.busyManager 	= new BusyManager(_container.stage);
			this.cursorManager 	= new CursorManager(_container.stage);
			
			initializeApp();
		}
		
		private function initializeApp():void
		{
			//Load flash-config
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loader_complete);
			loader.load(new URLRequest(_configURL));
			
			function loader_complete(e:Event):void
			{
				loader.removeEventListener(Event.COMPLETE, loader_complete);
				config.parse(XML(loader.data));
				
				//debug
				if (isDebug())
				{
					_browser = new MVCAppBrowser();
					_container.addChild(_browser);
					//_view.y = 40;
				}
				
				setup();
				initialize();
				
				initPreloader();
				//router.initializeRouter();
				
				//
				//initialize();
				
				//dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		
		private function initPreloader():void 
		{
			_container.addChild(_preloader);
			_preloader.addEventListener(Event.COMPLETE, preloader_complete);
			_preloader.load();
			
			this.load();
			
			function preloader_complete(e:Event):void 
			{
				_preloader.removeEventListener(Event.COMPLETE, preloader_complete);
				_preloader.initializeView();
				_preloader.show();
				
				router.initializeRouter();
			}
			
			
		}
		
		public function load():void 
		{
			//setup();
			
			//trace(this, "load");
			
			//appview
			_loader.addLoaderItem(new ViewLoaderItem("app-view", _view));
			
			//GLog.log("");
			router.addEventListener(Event.CHANGE, router_change);
			
			function router_change():void 
			{
				router.removeEventListener(Event.CHANGE, router_change);
				
				_loader.addEventListener(ProgressEvent.PROGRESS, 	loader_progress);
				_loader.addEventListener(Event.COMPLETE, 			loader_complete);
				
				_loader.load();
				
				if (isDebug())
					_browser.initialize();
			}
		}
		
		private function loader_progress(e:ProgressEvent):void 
		{
			//GLog.log(_loader.progress);
			
			_preloader.progress = _loader.progress;
		}
		
		private function loader_complete(e:Event):void
		{
			//GLog.log("");
			
			_loader.removeEventListener(ProgressEvent.PROGRESS, 	loader_progress);
			_loader.removeEventListener(Event.COMPLETE, 			loader_complete);
			
			_preloader.hide(preloader_hideComplete);
			
			function preloader_hideComplete():void 
			{
				_container.addChild(_view);
				_view.initializeView();
				
				_view.show(view_showComplete);
				
				_loaded = true;
			}
			
			function view_showComplete():void 
			{
				/*Controller(_loader.getItem("controller")).render();
				_loader.removeItem("controller");*/
				
				//_view.viewRender.swap(Controller(_loader.getItem("controller")).getView());
			}
			
			//dispatchEvent(e);
		}
		
		protected function setup():void 
		{
			
		}
		
		protected function initialize():void 
		{
			
		}
		
		public function executeAction(action:RouteAction):void 
		{
			//GLog.log("");
			
			action.post = this.post;
			
			var controller:Controller 	= new action.route.controller();
			controller.app				= this;
			controller.action			= action;
			
			MonsterDebugger.trace("executeAction", action);
			//return;
			//controller.app 				= this;
			controller.initializeController();
			
			view.render(controller);
			
			//Caso o aplicativo esteja carregado
			if (_loaded)
			{
				//view.render(controller);
				/*controller.loader.addEventListener(Event.COMPLETE, controller_complete);
				controller.loader.load();*/
			}
			//Caso seja a primeira Action, ou seja, o aplicativo ainda não foi carregado
			else
				//_loader.addLoaderItem(new ControllerLoaderItem("controller", controller));
				
			function controller_complete(e:Event):void 
			{
				//controller.loader.removeEventListener(Event.COMPLETE, controller_complete);
				//controller.render();
			}
		}
		
		public function isDebug():Boolean
		{
			return config.getAppKey("debug") == "true";
		}
		
		public function postURL(url:String, data:Object):void 
		{
			post = data;
			
			navigateURL(url);
		}
		
		public function changeTitle(title:String):void 
		{
			SWFAddress.setTitle(title);
		}
		
		public function navigateURL(url:String):void 
		{
			SWFAddress.setValue(url);
			
			if (_tracker)
				_tracker.trackURL(url);
		}
		
		public function getCurrentURL():String
		{
			return SWFAddress.getValue();
		}
		
		public function get loader():GLoader { return _loader; }
		
		public function get container():Sprite { return _container; }
		
		public function get view():AbstractAppView { return _view; }
		
		public function busy():void 
		{
			busyManager.busy();
		}
		
		public function available():void 
		{
			busyManager.available();
		}
		
		override public function destroy():void
		{
			router 		= null;
		}
	}
}