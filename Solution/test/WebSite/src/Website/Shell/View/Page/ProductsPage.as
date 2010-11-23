package Website.Shell.View.Page 
{
	import Geleca.Website.View.Page;
	import Website.Domain.Pages;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProductsPage extends Page
	{
		
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
		
	}

}