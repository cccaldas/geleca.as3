package Pages.Products.View 
{
	import Asset.Products.ProductsPageAsset;
	import caurina.transitions.Tweener;
	import Simbionte.View.Component.Component;
	
	public class ProductsPageView extends Component
	{
		
		public function ProductsPageView(asset:ProductsPageAsset) 
		{
			super(asset);
		}
		
		override protected function setVariables():void 
		{
			asset.alpha = 0;
			
			super.setVariables();
		}
		
		public function show(onComplete:Function):void 
		{
			Tweener.addTween(asset, { alpha:1, time:1, onComplete:onComplete } );
		}
		
		public function hide(onComplete:Function):void 
		{
			Tweener.addTween(asset, { alpha:0, time:1, onComplete:onComplete } );
		}
		
		protected function get asset():ProductsPageAsset { return ProductsPageAsset(_asset); }
		
	}

}