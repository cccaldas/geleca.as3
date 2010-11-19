package Shell.View 
{
	import Asset.MainAsset;
	import Shell.Controller.MainController;
	import flash.display.Sprite;
	import Simbionte.View.View;
	import Shell.View.Button.PageButton;
	
	public class MainView extends View
	{
		public var btn_contact			:PageButton;
		public var btn_products			:PageButton;
		
		public function MainView(asset:Sprite) 
		{
			super(asset);
		}
		
		override protected function setVariables():void 
		{
			btn_contact 	= new PageButton(asset.btn_contact);
			btn_products 	= new PageButton(asset.btn_products);
			
			super.setVariables();
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			btn_contact.initializeView();
			btn_products.initializeView();
			
			new MainController(this).initializeController();
		}
		
		protected function get asset():MainAsset { return MainAsset(_asset); }
		public function get pageContainer():Sprite { return asset.ctn_pages; }
		
	}

}