package Geleca.Website.View 
{
	import flash.system.System;
	import Geleca.Events.PageEvent;
	import Geleca.Events.PageLoaderEvent;
	import Geleca.View.View;
	import Geleca.Website.Controller.PageLoader;
	
	public class Page extends View
	{
		private var _pathNames		:Array = [];
		private var _loaded			:Boolean = false;
		private var _isLoading		:Boolean = false;
		private var _percentLoaded	:Number = 0;
		
		private var _loaderClass	:Class;	
		private var _viewClass		:Class;
		
		private var _loader			:PageLoader;
		private var _view			:PageView;
		
		public function Page(loader:Class, view:Class) 
		{
			_loaderClass 	= loader;
			_viewClass 		= view;
		}
		
		public function getPageName():String
		{
			return null;
		}
		
		/**Verificação da URL para exibição da Página.*/
		public function checkRoute(pathNames:Array):Boolean
		{
			return false;
		}
		
		public final function navigate():void 
		{
			_view.navigate();
		}
		
		public final function load():void 
		{
			this._isLoading = true;
			
			dispatchEvent(new PageEvent(PageEvent.LOAD));
			
			page_load();
		}
		
		protected function page_load():void 
		{
			_loader = new _loaderClass();
			_loader.addEventListener(PageLoaderEvent.PROGRESS, loader_progress);
			_loader.addEventListener(PageLoaderEvent.COMPLETE, loader_complete);
			_loader.load();
		}
		
		private function loader_progress(e:PageLoaderEvent):void 
		{
			updateProgress(_loader.percentLoaded);
		}
			
		private function loader_complete(e:PageLoaderEvent):void 
		{
			_view = addView(new _viewClass()) as PageView;
			_view.page = this;
			
			_loader.removeEventListener(PageLoaderEvent.COMPLETE, loader_complete);
			
			this.navigate();
			
			_view.show(show_complete);
		}
			
		private function show_complete():void 
		{
			pageLoadComplete();
		}
		
		protected final function pageLoadComplete():void 
		{
			this._isLoading 	= false;
			this._loaded 		= true;
			this._percentLoaded = 1;
			
			dispatchEvent(new PageEvent(PageEvent.LOAD_COMPLETE));
		}
		
		public final function unload():void 
		{
			this._isLoading 	= false;
			this._loaded 		= false;
			this._percentLoaded = 0;
			
			dispatchEvent(new PageEvent(PageEvent.UNLOAD));
			
			page_unload();
		}
		
		protected function page_unload():void 
		{
			_loader.destroy();
			_loader = null;
			
			_view.hide(hide_complete);
			
			function hide_complete():void 
			{
				removeView(_view)
				_view = null;
				
				pageUnloadComplete();
			}
		}
		
		protected final function pageUnloadComplete():void 
		{			
			dispatchEvent(new PageEvent(PageEvent.UNLOAD_COMPLETE));
			
			System.gc();
		}
		
		protected final function updateProgress(percent:Number):void 
		{
			_percentLoaded = percent;
			dispatchEvent(new PageEvent(PageEvent.LOAD_PROGRESS));
		}
		
		public function get loaded()		:Boolean 	{ return _loaded; }
		public function get isLoading()		:Boolean 	{ return _isLoading; }
		public function get percentLoaded()	:Number 	{ return _percentLoaded; }
		
		public function get pathNames():Array { return _pathNames; }
		
		public function set pathNames(value:Array):void 
		{
			_pathNames = value;
		}
		
		public function get loader():PageLoader { return _loader; }
		
		
	}

}