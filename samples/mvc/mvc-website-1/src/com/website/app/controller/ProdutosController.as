package com.website.app.controller
{
	import com.geleca.as3.data.entity.EntitySet;
	import com.geleca.as3.data.XmlDataAdapter;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.FileLoaderItem;
	import com.geleca.as3.mvc.core.ActionResult;
	import com.geleca.as3.mvc.core.Controller;
	import com.geleca.as3.mvc.core.FileEntityLoaderItem;
	import com.website.app.view.ProdutosView;
	import com.website.domain.dao.ProdutoDAO;
	import com.website.domain.entity.ProdutoEntity;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class ProdutosController extends Controller
	{
		public function ProdutosController()
		{
			
		}
		
		override public function load():void 
		{
			if(!app.context.has("produtos"))
				loader.addLoaderItem(new FileLoaderItem("produtos.xml", app.config.getAppKey("path-xml") + "produtos.xml"));
			
			super.load();
		}
		
		override protected function load_complete():void 
		{
			super.load_complete();
			
			if(loader.getItem("produtos.xml") != null)
				app.context.add("produtos", loader.getItem("produtos.xml"));
		}
		
		public function index():ActionResult 
		{
			//GLog.log("");
			
			var produtos:Vector.<ProdutoEntity> = new ProdutoDAO().getProdutos();
			viewData["produtos"] = produtos;
			var items:Array = [];
			
			for each (var item:ProdutoEntity in produtos) 
				items.push(new FileEntityLoaderItem(item.thumb));
			
			return new ActionResult(ProdutosView, null, items);
		}
		
		public function produto():ActionResult   
		{
			//GLog.log("");
			var produto:ProdutoEntity = new ProdutoDAO().getProduto(uint(action.parameters.get("id")));
			viewData["produto"] = produto;
			
			return new ActionResult(ProdutosView, null, [new FileEntityLoaderItem(produto.thumb)]);
		}
		
	}
}