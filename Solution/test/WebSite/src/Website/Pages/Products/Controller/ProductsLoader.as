package Website.Pages.Products.Controller 
{
	import br.com.stimuli.loading.BulkLoader;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import Geleca.Events.SimpleEventDispatcher;
	import Website.Domain.Facade;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProductsLoader extends SimpleEventDispatcher
	{
		private var _bulkLoader						:BulkLoader = new BulkLoader(BulkLoader.getUniqueName());
		private var _facade							:Facade = Facade.getInstance();
		
		public function ProductsLoader() 
		{
			
		}
		
		public function load():void 
		{
			_bulkLoader.add(_facade.appConfig.PATH_ASSETS + "Products.swf", { id:"asset", context:new LoaderContext(false, ApplicationDomain.currentDomain) } );
			_bulkLoader.addEventListener(Event.COMPLETE, bulkLoader_complete);
			
			_bulkLoader.start();
		}
		
		private function bulkLoader_complete(e:Event):void 
		{
			dispatchEvent(e);
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_bulkLoader.removeAll();
			_bulkLoader.removeEventListener(Event.COMPLETE, bulkLoader_complete);
			
			_bulkLoader = null;
			_facade = null;
		}
		
	}

}