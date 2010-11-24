package Website.Pages.Products.Controller 
{
	import com.asual.swfaddress.SWFAddress;
	import flash.events.MouseEvent;
	import Geleca.Controller.Controller;
	import Website.Pages.Products.View.ProductsView;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProductsController extends Controller
	{
		private var _view				:ProductsView;
		
		public function ProductsController(view:ProductsView) 
		{
			_view = view;
		}
		
		override protected function setListeners():void 
		{
			super.setListeners();
			
			_view.btn_detail.addEventListener(MouseEvent.CLICK, btn_detail_click);
			_view.btn_list.addEventListener(MouseEvent.CLICK, btn_list_click);
		}
		
		public function navigate():void 
		{
			_view.ctr_grid.visible = _view.page.pathNames[0] == "products";
			_view.ctr_detail.visible = _view.page.pathNames[0] == "product";
			//trace(this, "navigate", _view.page.pathNames);
		}
		
		private function btn_detail_click(e:MouseEvent):void 
		{
			SWFAddress.setValue("/product/1/product-1/");
		}
		
		private function btn_list_click(e:MouseEvent):void 
		{
			SWFAddress.setValue("/products/");
		}
		
	}

}