package simbionte.modules 
{
	import flash.utils.Dictionary;
	
	public class ModuleManager
	{
		private var _modules			:Dictionary = new Dictionary();
		
		public function ModuleManager() 
		{
			
		}
		
		public function add(module:ModuleLoader):void 
		{
			_modules[module.moduleName] = module;
		}
		
		public function remove(name:String):void 
		{
			_modules[name] = null;
			delete _modules[name];
		}
		
		public function get(name:String):ModuleLoader
		{
			return ModuleLoader(_modules[name]);
		}
		
	}

}