package com.project.app
{
	import br.com.stimuli.loading.BulkLoader;
	
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.TimerLoaderItem;
	import com.geleca.as3.mvc.core.MVCApp;
	import com.geleca.as3.mvc.core.Route;
	import com.geleca.as3.util.FunctionUtil;
	import com.geleca.as3.util.StatsMonitor;
    
    public class App extends MVCApp
    {
        private static var _instance            :App = null;
		
        public function App(enforcer:SingletonEnforcer)
        {
            
        }
		
		public static function getInstance():App
		{
			if (_instance == null)
				_instance = new App(new SingletonEnforcer());
			
			return _instance;
		}
		
		override public function load():void 
		{
			loader.addLoaderItem(new TimerLoaderItem("timer", 2));
			
			super.load();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			if(isDebug())
				container.addChild(new StatsMonitor()); 
			
			router.add(new Route("index", 				"/", 										IndexController, "index", true));
			
			//test
			
			if(isDebug())
			{
				//start
				//navigateURL(router.generateURL("index"));
			}
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			
		}
		
		override protected function loader_complete():void 
		{
			
						
			super.loader_complete();
		}

    }
}

class SingletonEnforcer {}

