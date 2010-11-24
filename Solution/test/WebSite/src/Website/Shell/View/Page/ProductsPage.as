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
		
		public function ProductsPage() 
		{
			super(ProductsLoader, ProductsView);
		}
		
		override public function checkRoute(pathNames:Array):Boolean 
		{
			return pathNames[0] == "products" || pathNames[0] == "product";
		}
		
		override public function getPageName():String 
		{
			return Pages.PRODUCTS;
		}
		
	}

}