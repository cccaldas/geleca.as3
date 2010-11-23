package Website.Pages.Products.View 
{
	import caurina.transitions.Tweener;
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	import Geleca.Effects.Transition.FadeTransition;
	import Geleca.Website.View.Page;
	import Website.Domain.Pages;
	
	public class ProductsView extends Page
	{
		private var _asset				:Sprite;		
		
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
			return Pages.PRODUCTS;
		}
		
		override public function show(onComplete:Function=null):void 
		{
			this.visible = true;
			var cl:Class = getDefinitionByName("Website.Products.Asset.ProductsAsset") as Class;
			
			_asset = new cl() as Sprite;
			addChild(_asset);
			
			FadeTransition.fadeIn(this, 0, 1, .7, onComplete);
		}
		
		override public function hide(onComplete:Function=null):void 
		{
			FadeTransition.fadeOut(this, 0, 0, .7, hide_complete);
			
			function hide_complete():void 
			{
				this.visible = false;
				removeChild(_asset);
				
				Tweener.removeTweens(this);
				
				_asset = null;
				
				if (onComplete != null)
					onComplete();
			}
		}
		
	}

}