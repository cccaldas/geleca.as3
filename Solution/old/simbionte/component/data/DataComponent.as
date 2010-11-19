package simbionte.component.data 
{
	import flash.system.System;
	import simbionte.component.Component;
	import simbionte.events.ComponentEvent;
	
	public class DataComponent extends Component implements IBindable
	{
		private var _dataSource						:Object;
		
		public function DataComponent() 
		{
			
		}
		
		public final function dataBind():void 
		{
			if (initialized) 
			{
				bind();
			}
			else 
			{
				addEventListener(ComponentEvent.INITIALIZED, component_initialized, false, 0, true);
			}
		}
		
		private function component_initialized(e:ComponentEvent):void 
		{
			removeEventListener(ComponentEvent.INITIALIZED, component_initialized);
			
			bind();
		}
		
		protected function bind():void 
		{
			
		}
		
		public function get dataSource():Object { return _dataSource; }
		
		public function set dataSource(value:Object):void 
		{
			_dataSource = value;
		}
		
		override public function destroy():void 
		{
			_dataSource = null;
			
			super.destroy();
		}
		
	}

}