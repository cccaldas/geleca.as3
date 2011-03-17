package com.website.app.controller
{
	import com.geleca.as3.data.entity.EntitySet;
	import com.geleca.as3.data.XmlDataAdapter;
	import com.geleca.as3.loading.FileLoaderItem;
	import com.geleca.as3.mvc.core.ActionResult;
	import com.geleca.as3.mvc.core.Controller;
	import com.website.app.model.ProdutosModel;
	import com.website.app.view.ProdutosView;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class ProdutosController extends Controller
	{
		public function ProdutosController()
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			view = ProdutosView;
		}
		
		public function index():void 
		{
			viewData["produtos"] = new ProdutosModel(app).getProdutos();
		}
		
		public function produto():void   
		{
			viewData["produto"] = new ProdutosModel(app).getProduto(uint(parameters.get("id")));
		}
		
	}
}