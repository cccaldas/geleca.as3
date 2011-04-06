package com.website.app
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.CallBackLoaderItem;
	import com.geleca.as3.loading.FileLoaderItem;
	import com.geleca.as3.loading.TimerLoaderItem;
	import com.geleca.as3.mvc.core.MVCApp;
	import com.geleca.as3.mvc.core.Route;
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
			//GLog.log("");
			
			//loader.addLoaderItem(new FileLoaderItem("produtos.xml", config.getAppKey("path-xml") + "produtos.xml"));
			
			if(isDebug())
				loader.addLoaderItem(new TimerLoaderItem("timer", 2));
			
			super.load();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			router.add(new Route("home", 			"/", 						HomeController, "index", true));
			router.add(new Route("contato", 		"/contato/", 				ContatoController));
			router.add(new Route("contato-send",	"/contato/send/", 			ContatoController, "send"));
			router.add(new Route("produtos",		"/produtos/", 				ProdutosController));
			router.add(new Route("produto",			"/produto/{id}/{nome}/", 	ProdutosController, "produto"));
			
			//Test
			//navigateURL("/produto/1/teste/");
			//navigateURL("/contato/");
			navigateURL("/produtos/");
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

