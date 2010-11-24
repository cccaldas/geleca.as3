package Website.Pages.Contact.Controller 
{
	import br.com.stimuli.loading.BulkLoader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import Geleca.Events.SimpleEventDispatcher;
	import Geleca.Website.Controller.PageLoader;
	import Website.Domain.Facade;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ContactLoader extends PageLoader
	{
		private var _bulkLoader						:BulkLoader = new BulkLoader(BulkLoader.getUniqueName());
		private var _facade							:Facade = Facade.getInstance();
		
		public function ContactLoader() 
		{
			
		}
		
		override protected function loader_load():void 
		{
			super.loader_load();
			
			_bulkLoader.add(_facade.appConfig.PATH_ASSETS + "Contact.swf", { id:"asset", context:new LoaderContext(false, ApplicationDomain.currentDomain) } );
			
			_bulkLoader.addEventListener(Event.COMPLETE, 			bulkLoader_complete);
			_bulkLoader.addEventListener(ProgressEvent.PROGRESS, 	bulkLoader_progress);
			
			_bulkLoader.start();
		}
		
		private function bulkLoader_progress(e:ProgressEvent):void 
		{
			updateProgress(_bulkLoader.percentLoaded);
		}
		
		private function bulkLoader_complete(e:Event):void 
		{
			loader_loadComplete();
		}
		
		override protected function loader_complete():void 
		{
			super.loader_complete();
			
			_bulkLoader.removeAll();
			_bulkLoader.removeEventListener(Event.COMPLETE, bulkLoader_complete);
			_bulkLoader.removeEventListener(ProgressEvent.PROGRESS, bulkLoader_progress);
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_bulkLoader = null;
			_facade = null;
		}
		
	}

}