package com.website.app 
{
	import com.geleca.as3.loading.FileLoaderItem;
	import com.geleca.as3.loading.TimerLoaderItem;
	import com.geleca.as3.mvc.core.MasterView;
	import com.geleca.as3.mvc.core.MVCApp;
	import com.geleca.as3.mvc.core.Router;
	import com.website.app.controller.ContatoController;
	import com.website.app.controller.HomeController;
	import com.website.app.controller.ProdutosController;
	import com.website.app.view.AppLoaderView;
	import com.website.app.view.AppView;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class App extends MVCApp
	{
		
		public function App(container:Sprite) 
		{
			super(container, new AppLoaderView(), new AppView(), new Router());
		}
		
		override public function load():void 
		{
			loader.addLoaderItem(new FileLoaderItem("produtos.xml", config.getAppKey("path-xml") + "produtos.xml"));
			loader.addLoaderItem(new TimerLoaderItem("timer", 2));
			
			super.load();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			router.add("/", 					HomeController);
			//router.add("/home/", 				HomeController);
			
			router.add("/contato/", 			ContatoController);
			router.add("/contato/send/",		ContatoController, "send");
			
			router.add("/produtos/", 			ProdutosController);
			router.add("/produto/{id}/{nome}/", ProdutosController, "produto");
		}
		
	}

}