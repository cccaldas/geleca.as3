package com.geleca.as3.test.website
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.TimerLoaderItem;
	import com.geleca.as3.mvc.core.MVCApp;
	import com.geleca.as3.mvc.core.Route;
	import com.geleca.as3.ui.CustomContextMenu;
	import com.geleca.as3.util.FunctionUtil;
	import com.geleca.as3.test.website.controller.HomeController;
    
    public class App extends MVCApp
    {
        private static var _instance            :App = null;
		
        public function App(enforcer:SingletonEnforcer)
        {
            super();
        }
		
		public static function getInstance():App
		{
			if (_instance == null)
				_instance = new App(new SingletonEnforcer());
			
			return _instance;
		}
		
		override public function load():void 
		{
			if(isDebug())
				loader.addLoaderItem(new TimerLoaderItem("timer", 2));
			
			super.load();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			router.add(new Route("home", "/", HomeController, "index", true));
			
			//GLog.log();
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			//trace(new ViewModelDAO().getMasterViewModel());
		}
		
		override protected function loader_complete():void 
		{
			//new CustomContextMenu(container, true);
			
			super.loader_complete();
		}

    }
}

class SingletonEnforcer {}