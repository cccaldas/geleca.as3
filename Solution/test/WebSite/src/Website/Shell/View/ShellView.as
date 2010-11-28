package Website.Shell.View 
{
	import Geleca.Component.Button.Button;
	import Geleca.View.View;
	import Geleca.Website.View.PageSwitcher;
	import Website.Shell.Asset.ShellAsset;
	import Website.Shell.Controller.ShellController;
	import Website.Shell.View.Control.FooterControl;
	import Website.Shell.View.Control.HeaderControl;
	import Website.Shell.View.Page.ContactPage;
	import Website.Shell.View.Page.ProductsPage;
	import Website.Shell.View.Preloader.PagesPreloader;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ShellView extends View
	{
		private var _controller			:ShellController;
		private var _asset				:ShellAsset = new ShellAsset();
		
		public var ctr_header			:HeaderControl;
		public var ctr_footer			:FooterControl;
		
		public var btn_products			:Button;
		public var btn_contact			:Button;
		
		public var pgs_pages			:PageSwitcher;
		
		public var prl_pages			:PagesPreloader;
		
		public function ShellView() 
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			addChild(_asset);
			
			pgs_pages = addView(new PageSwitcher()) as PageSwitcher;
			pgs_pages.move(50, 120);
			
			pgs_pages.addPage(new ContactPage());
			pgs_pages.addPage(new ProductsPage());
			
			ctr_header = addComponent(new HeaderControl(_asset.ctr_header)) as HeaderControl;
			ctr_footer = addComponent(new FooterControl(_asset.ctr_footer)) as FooterControl;
			
			btn_products 	= addComponent(new Button(_asset.ctr_header.btn_products)) as Button;
			btn_contact 	= addComponent(new Button(_asset.ctr_header.btn_contact)) as Button;
			
			prl_pages		= addComponent(new PagesPreloader(_asset.prl_pages)) as PagesPreloader;
			
			_controller = new ShellController(this);
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_controller.initializeController();
		}
		
	}

}