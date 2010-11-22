package Website.Domain
{
	import Geleca.Layout.Layout;
    
    public class Facade
    {
        private static var _instance            :Facade = null;
		
		public var layout						:Layout = new Layout();
		
        public function Facade(enforcer:SingletonEnforcer)
        {
            
        }
		
		public static function getInstance():Facade
		{
			if (_instance == null)
				_instance = new Facade(new SingletonEnforcer());
			
			return _instance;
		}

    }
}

class SingletonEnforcer {}

