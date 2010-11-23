package Shell.Controller 
{
	import com.asual.swfaddress.SWFAddress;
	import Geleca.Controller.Controller;
	import flash.events.MouseEvent;
	import Geleca.Website.Controller.PageSwitch;
	import Website.Shell.View.ShellView;
	
	public class ShellController extends Controller
	{
		private var view				:ShellView;
		
		private var _pageSwitch			:PageSwitch = new PageSwitch();
		
		public function ShellController(view:ShellView)
		{
			this.view = view;
		}
		
		override protected function setVariables():void 
		{
			_pageSwitch.addPage(view.pg_contact);
			_pageSwitch.addPage(view.pg_products);
			
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
			SWFAddress.setValue("/contact/");
		}
		
		private function btn_products_click(e:MouseEvent):void 
		{
			SWFAddress.setValue("/products/");
		}
		
		override protected function initialize():void 
		{
			_pageSwitch.initializeController();
			
			super.initialize();
		}
		
	}

}