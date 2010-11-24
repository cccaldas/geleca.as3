package Website.Pages.Products.View 
{
	import caurina.transitions.Tweener;
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	import Geleca.Component.Button.Button;
	import Geleca.Effects.Transition.FadeTransition;
	import Geleca.View.View;
	import Geleca.Website.View.Page;
	import Geleca.Website.View.PageView;
	import Website.Domain.Pages;
	import Website.Pages.Products.Controller.ProductsController;
	import Website.Pages.Products.View.Control.DetailControl;
	import Website.Pages.Products.View.Control.GridControl;
	
	public class ProductsView extends PageView
	{
		private var _asset			:Sprite;
		private var _controller		:ProductsController;
		
		public var ctr_grid			:GridControl;
		public var ctr_detail		:DetailControl;
		
		public var btn_detail		:Button;
		public var btn_list			:Button;
		
		public function ProductsView()
		{
			
		}
		
		override protected function setAssets():void 
		{
			super.setAssets();
			
			var cl:Class = getDefinitionByName("Website.Products.Asset.ProductsAsset") as Class;
			_asset = new cl() as Sprite;
			
			addChild(_asset);
		}
		
		override protected function setVariables():void 
		{
			super.setVariables();
			
			this.visible = false;
			this.alpha = 0;
			
			_controller = new ProductsController(this);
		}
		
		override protected function setComponents():void 
		{
			super.setComponents();
			
			ctr_grid 	= addComponent(new GridControl(_asset.getChildByName("ctr_grid") as Sprite)) as GridControl;
			ctr_detail 	= addComponent(new DetailControl(_asset.getChildByName("ctr_detail") as Sprite)) as DetailControl;
			
			btn_detail 	= addComponent(new Button(_asset.getChildByName("btn_detail") as Sprite)) as Button;
			btn_list 	= addComponent(new Button(_asset.getChildByName("btn_list") as Sprite)) as Button;
		}
		
		override public function navigate():void 
		{
			super.navigate();
			
			_controller.navigate();
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_controller.initializeController();
		}
		
		override public function show(onComplete:Function=null):void 
		{
			this.visible = true;
			
			FadeTransition.fadeIn(this, 0, 1, .7, onComplete);
		}
		
		override public function hide(onComplete:Function=null):void 
		{
			FadeTransition.fadeOut(this, 0, 0, .7, hide_complete);
			
			function hide_complete():void 
			{
				this.visible = false;
				removeChild(_asset);
				
				_controller.destroy();
				_controller = null;
				
				Tweener.removeTweens(this);
				
				_asset = null;
				
				if (onComplete != null)
					onComplete();
			}
		}		
	}

}