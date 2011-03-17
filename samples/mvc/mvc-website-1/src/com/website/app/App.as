package com.website.app
{
	import com.geleca.as3.loading.FileLoaderItem;
	import com.geleca.as3.loading.TimerLoaderItem;
	import com.geleca.as3.mvc.core.MVCApp;
	import com.website.app.controller.ContatoController;
	import com.website.app.controller.HomeController;
	import com.website.app.controller.ProdutosController;
    
    public class App extends MVCApp
    {
        private static var _instance            :App = null;
		
        public function App(enforcer:SingletonEnforcer)
        {
            
        }
		
		override public function load():void 
		{
			loader.addLoaderItem(new FileLoaderItem("produtos.xml", config.getAppKey("path-xml") + "produtos.xml"));
			
			if(isDebug())
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
		
		public static function getInstance():App
		{
			if (_instance == null)
				_instance = new App(new SingletonEnforcer());
			
			return _instance;
		}

    }
}

class SingletonEnforcer {}

