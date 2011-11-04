package com.geleca.as3.test.website.controller
{
	import com.geleca.as3.collection.List;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.*;
	import com.geleca.as3.mvc.core.ActionResult;
	import com.geleca.as3.mvc.core.Controller;
	import com.geleca.as3.mvc.core.FileEntityLoaderItem;
	import com.geleca.as3.util.VectorUtil;
	import com.geleca.as3.loading.JSONLoaderItem;
	
	import com.geleca.as3.test.website.view.*;
	import com.geleca.as3.test.website.model.*;
	import com.geleca.as3.test.website.model.vo.*;

	public class ProductsController extends Controller
	{
		public function ProductsController()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
		}
		
		override public function load():void
		{
			loader.addLoaderItem(new JSONLoaderItem("data", app.config["path_data"] + "products.json"));
			loader.addLoaderItem(new YAMLLoaderItem("lang", app.config["path_lang"] + "pt-br/products.yaml"));
			
			super.load();
		}
		
		override protected function load_complete():void
		{
			super.load_complete();
			
			//trace(this, loader.getItem("data"));
			
			//GLog.log(loader.getItem("data.xml"));
		}
		
		override protected function setup():void
		{
			// TODO Auto Generated method stub
			super.setup();
		}
		
		public function index():ActionResult
		{
			viewData["products"] = new ProductsModel(loader.getItem("data")).getProducts();
			
			viewData["lang"] = loader.getItem("lang");
			
			var loadingItems:Array = [];
			
			for each (var product:ProductVO in viewData["products"])
			{
				loadingItems.push(new FileEntityLoaderItem(product.photo));
			}
			
			/*var medias:Vector.<MediaVO> = new MediasModel(this.app, XML(loader.getItem("data.xml"))).getMedias();
			
			viewData["medias"] = medias;
			
			var loadingItems:Array = [];
			
			for (var i:int = 0; i < medias.length; i++) 
			{
				//GLog.log(medias[i].thumb.src);
				loadingItems.push(new FileEntityLoaderItem(medias[i].thumb));
			}*/
			
			
			//GLog.log(medias);
			
			return new ActionResult(ProductsView, null, loadingItems);
		}
	}
}