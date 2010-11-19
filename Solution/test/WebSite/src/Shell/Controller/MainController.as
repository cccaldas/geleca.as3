package Shell.Controller 
{
	import Domain.PageNames;
	import flash.events.MouseEvent;
	import Pages.Contact.View.Page.ContactPage;
	import Pages.Products.View.Page.ProductsPage;
	import Simbionte.Controller.Controller;
	import Simbionte.Website.Controller.PageSwitch;
	import Simbionte.Website.View.Component.Page;
	import Shell.View.MainView;
	
	public class MainController extends Controller
	{
		private var view				:MainView;
		
		private var _pageSwitch			:PageSwitch = new PageSwitch();
		
		public function MainController(view:MainView)
		{
			this.view = view;
		}
		
		override protected function setVariables():void 
		{
			_pageSwitch.addPage(new ContactPage(view.pageContainer).initializeView() as Page);
			_pageSwitch.addPage(new ProductsPage(view.pageContainer).initializeView() as Page);
			
			
			super.setVariables();
		}
		
		override protected function setListeners():void 
		{
			view.btn_contact.addEventListener(MouseEvent.CLICK, 	btn_contact_click);
			view.btn_products.addEventListener(MouseEvent.CLICK, 	btn_products_click);
			
			super.setListeners();
		}
		
		private function btn_contact_click(e:MouseEvent):void 
		{
			_pageSwitch.gotoPage(PageNames.CONTACT);
		}
		
		private function btn_products_click(e:MouseEvent):void 
		{
			_pageSwitch.gotoPage(PageNames.PRODUCTS);
		}
		
		override protected function initialize():void 
		{
			_pageSwitch.initializeController();
			
			super.initialize();
		}
		
	}

}