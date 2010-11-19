package Domain.Facade 
{
	import Domain.Data.Entities;
    
    public class Facade
    {
        private static var _instance            :Facade = null;
		
		public var entities						:Entities = new Entities();
		
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

