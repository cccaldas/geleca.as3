package simbionte.modules 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.System;
	import simbionte.events.ModuleEvent;
	import simbionte.utils.ContainerUtil;

	public class Module extends Sprite
	{
		private var _loader				:ModuleLoader;
		
		public function Module() 
		{
			
		}
		
		public final function initialize():void
		{
			dispatchEvent(new ModuleEvent(ModuleEvent.INITIALIZE));
			module_initialize();
		}
		
		protected function module_initialize():void 
		{
			
		}
		
		public final function unload():void
		{
			dispatchEvent(new ModuleEvent(ModuleEvent.UNLOAD));
			module_unload();
		}
		
		protected function module_unload():void 
		{
			
		}
		
		public final function dispose():void 
		{
			dispatchEvent(new ModuleEvent(ModuleEvent.DISPOSE));
			module_dispose();
		}
		
		protected function module_dispose():void 
		{
			ContainerUtil.removeAllChilds(this);
			
			if (parent)
			{
				var dsp:DisplayObject = parent.getChildByName(name);
				parent.removeChild(dsp);
				System.gc();
				dsp = null;
			}
			
			_loader = null;
		}
		
		public function get loader():ModuleLoader { return _loader; }
		
		public function set loader(value:ModuleLoader):void 
		{
			_loader = value;
		}
		
	}

}