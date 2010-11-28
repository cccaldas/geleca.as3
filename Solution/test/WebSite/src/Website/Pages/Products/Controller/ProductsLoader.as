package Website.Pages.Products.Controller 
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import Geleca.Events.SimpleEventDispatcher;
	import Geleca.Website.Controller.Loading.AssetLoaderItem;
	import Geleca.Website.Controller.Loading.FileLoaderItem;
	import Geleca.Website.Controller.Loading.ServiceLoaderItem;
	import Geleca.Website.Controller.PageLoader;
	import Website.Domain.Facade;
	import Website.Domain.Service;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProductsLoader extends PageLoader
	{
		private var _facade							:Facade = Facade.getInstance();
		
		public function ProductsLoader() 
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			addLoaderItem(new AssetLoaderItem("asset", _facade.appConfig.PATH_ASSETS + "Products.swf"));
			addLoaderItem(new FileLoaderItem("data", _facade.appConfig.PATH_XML + "data.xml"));
			addLoaderItem(new ServiceLoaderItem("produtos", new Service().getProducts));
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_facade = null;
		}
		
	}

}