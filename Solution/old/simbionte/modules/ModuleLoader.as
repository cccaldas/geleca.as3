package simbionte.modules 
{
	import simbionte.events.SimpleEventDispatcher;
	
	public class ModuleLoader extends SimpleEventDispatcher
	{
		
		public function ModuleLoader() 
		{
			
		}
		
		public function load():void 
		{
			
		}
		
		public function unload():void 
		{
			this.module.unload();
		}
		
		public function dispose():void 
		{
			this.module.dispose();
			this.destroy();
		}
		
		public function get moduleName():String 
		{
			return null;
		}
		
		public function get module():Module
		{
			return null;
		}
		
		public function get percentLoaded():Number
		{
			return 0;
		}
		
		public function get loaded():Boolean { return percentLoaded == 1; }
		
	}

}