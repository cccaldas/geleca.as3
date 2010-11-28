package Website.Shell.Controller 
{
	import com.asual.swfaddress.SWFAddress;
	import Geleca.Controller.Controller;
	import flash.events.MouseEvent;
	import Geleca.Events.PageEvent;
	import Website.Shell.View.Page.ContactPage;
	import Website.Shell.View.Page.ProductsPage;
	import Website.Shell.View.ShellView;
	
	public class ShellController extends Controller
	{
		private var view				:ShellView;
		
		public function ShellController(view:ShellView)
		{
			this.view = view;
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			view.btn_contact.addEventListener(MouseEvent.CLICK, 	btn_contact_click);
			view.btn_products.addEventListener(MouseEvent.CLICK, 	btn_products_click);
			
			view.pgs_pages.addEventListener(PageEvent.LOAD, 			pgs_pages_load);
			view.pgs_pages.addEventListener(PageEvent.LOAD_PROGRESS, 	pgs_pages_loadProgress);
			view.pgs_pages.addEventListener(PageEvent.LOAD_COMPLETE, 	pgs_pages_loadComplete);
		}
		
		private function btn_contact_click(e:MouseEvent):void 
		{
			SWFAddress.setValue("/contact/");
		}
		
		private function btn_products_click(e:MouseEvent):void 
		{
			SWFAddress.setValue("/products/");
		}
		
		override protected function initialize():void 
		{
			
			super.initialize();
		}
		
		private function pgs_pages_load(e:PageEvent):void 
		{
			view.prl_pages.show();
		}
		
		private function pgs_pages_loadProgress(e:PageEvent):void 
		{
			//trace(this, "pgs_pages_loadProgress", view.pgs_pages.getCurrentPage().percentLoaded);
			
			view.prl_pages.progress = view.pgs_pages.getCurrentPage().percentLoaded;
		}
		
		private function pgs_pages_loadComplete(e:PageEvent):void 
		{
			//trace(this, "pgs_pages_loadComplete");
			
			view.prl_pages.hide();
		}
		
	}

}