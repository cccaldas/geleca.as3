package Geleca.Website.View 
{
	import Geleca.Events.PageEvent;
	import Geleca.View.View;
	
	public class Page extends View
	{
		private var _pathNames		:Array = [];
		private var _loaded			:Boolean = false;
		private var _isLoading		:Boolean = false;
		private var _percentLoaded	:Number = 0;
		
		public function Page() 
		{
			
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
		
		public function navigate():void 
		{
			
		}
		
		public final function load():void 
		{
			this._isLoading = true;
			
			dispatchEvent(new PageEvent(PageEvent.LOAD));
			
			page_load();
		}
		
		protected function page_load():void 
		{
			
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
			
		}
		
		protected final function pageUnloadComplete():void 
		{			
			dispatchEvent(new PageEvent(PageEvent.UNLOAD_COMPLETE));
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
		
		
	}

}