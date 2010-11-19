package simbionte.component 
{
	import simbionte.events.ComponentEvent;
	import simbionte.events.SimpleEventDispatcher;
	import simbionte.events.StateEvent;
	
	public class Component extends SimpleEventDispatcher
	{
		private var _enabled								:Boolean = true;
		private var _initialized							:Boolean = false;
		
		public function Component() 
		{
			
		}
		
		protected function setAssets():void 
		{
			
		}
		
		protected function setVariables():void 
		{
			
		}
		
		protected function setListeners():void 
		{
			
		}
		
		protected function initialize():void 
		{
			
		}
		
		public final function initializeComponent():void 
		{
			setAssets();
			setVariables();
			setListeners();
			initialize();
			_initialized = true;
			dispatchEvent(new ComponentEvent(ComponentEvent.INITIALIZED));
		}
		
		public function set enabled(value:Boolean):void 
		{
			if (value != _enabled)
			{
				_enabled = value;
				
				if (value) enable();
				else disable();
			}
		}
		
		public final function get enabled()			:Boolean 	{ return _enabled; }
		public final function get initialized()		:Boolean 	{ return _initialized; }
		
		protected function enable():void 
		{
			
		}
		
		protected function disable():void 
		{
			
		}
		
		public function show():void 
		{
			
		}
		
		public function hide():void 
		{
			
		}
	}

}