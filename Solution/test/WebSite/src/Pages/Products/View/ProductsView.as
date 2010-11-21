package Pages.Products.View 
{
	import Asset.Products.ProductsPageAsset;
	import caurina.transitions.Tweener;
	import flash.display.Sprite;
	import Domain.PageNames;
	import Geleca.Website.View.Page;
	
	public class ProductsView extends Page
	{
		private var _asset				:ProductsPageAsset;		
		
		public function ProductsView() 
		{
			
		}
		
		override protected function setVariables():void 
		{
			super.setVariables();
			
			this.visible = false;
			this.alpha = 0;
		}
		
		override public function checkRoute(pathNames:Array):Boolean 
		{
			return pathNames[0] == "products";
		}
		
		override public function getPageName():String 
		{
			return PageNames.PRODUCTS;
		}
		
		override public function show(onComplete:Function=null):void 
		{
			this.visible = true;
			
			_asset = new ProductsPageAsset();
			
			addChild(_asset);
			
			Tweener.addTween(this, { alpha:1, time:1, onComplete:onComplete } );
		}
		
		override public function hide(onComplete:Function=null):void 
		{
			Tweener.addTween(this, { alpha:0, time:1, onComplete:hide_complete } );
			
			function hide_complete():void 
			{
				this.visible = false;
				removeChild(_asset);
				
				_asset = null;
				
				if (onComplete != null)
					onComplete();
			}
		}
		
	}

}