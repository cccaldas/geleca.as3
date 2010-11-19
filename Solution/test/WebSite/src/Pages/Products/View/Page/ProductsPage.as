package Pages.Products.View.Page 
{
	import Asset.Products.ProductsPageAsset;
	import flash.display.Sprite;
	import Pages.Products.View.ProductsPageView;
	import Simbionte.Website.View.Component.Page;
	import Domain.PageNames;
	
	public class ProductsPage extends Page
	{
		private var _pageAsset				:ProductsPageAsset;
		private var _view					:ProductsPageView;		
		
		public function ProductsPage(asset:Sprite) 
		{
			super(asset);
		}
		
		override public function getPageName():String 
		{
			return PageNames.PRODUCTS;
		}
		
		override public function show(onComplete:Function):void 
		{
			_pageAsset = new ProductsPageAsset();
			_asset.addChild(_pageAsset);
			
			_view = new ProductsPageView(_pageAsset);
			_view.initializeView();
			_view.show(onComplete);
		}
		
		override public function hide(onComplete:Function):void 
		{
			_view.hide(view_hideComplete);
			
			function view_hideComplete():void 
			{
				_asset.removeChild(_pageAsset);
		
				_view.destroy();
				_view = null;
				_pageAsset = null;
				
				if (onComplete != null)
					onComplete();
			}
		}
		
	}

}