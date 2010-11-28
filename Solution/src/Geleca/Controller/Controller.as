package Geleca.Controller 
{
	import Geleca.Events.SimpleEventDispatcher;
	
	public class Controller extends SimpleEventDispatcher
	{
		private var _initialized							:Boolean = false;
		
		public function Controller() 
		{
			
		}
		
		protected function setup():void 
		{
			
		}
		
		protected function initialize():void 
		{
			
		}
		
		public final function initializeController():void 
		{
			setup();
			initialize();
			_initialized = true;
		}
		
		public final function get initialized()		:Boolean 	{ return _initialized; }
	}

}