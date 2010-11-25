package CustomCursor.Domain
{
	import Geleca.Core.CursorManager;
    
    public class Facade
    {
        private static var _instance            :Facade = null;
		
		public var cursorManager				:CursorManager = new CursorManager();
		
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

