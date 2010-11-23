package Website.Shell.View.Page 
{
	import flash.events.Event;
	import Geleca.Website.View.Page;
	import Website.Domain.Pages;
	import Website.Pages.Products.Controller.ProductsLoader;
	import Website.Pages.Products.View.ProductsView;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProductsPage extends Page
	{
		private var _view				:ProductsView;
		private var _loader				:ProductsLoader;
		
		public function ProductsPage() 
		{
			
		}
		
		override public function checkRoute(pathNames:Array):Boolean 
		{
			return pathNames[0] == "products";
		}
		
		override public function getPageName():String 
		{
			return Pages.PRODUCTS;
		}
		
		override protected function page_load():void 
		{
			super.page_load();
			
			_loader = new ProductsLoader();
			_loader.addEventListener(Event.COMPLETE, loader_complete);
			_loader.load();
			
			function loader_complete():void 
			{
				_view = addView(new ProductsView()) as ProductsView;
				_loader.removeEventListener(Event.COMPLETE, loader_complete);
				_view.show(show_complete);
			}
			
			function show_complete():void 
			{
				pageLoadComplete();
			}
		}
		
		override protected function page_unload():void 
		{
			super.page_unload();
			
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
		
	}

}