package Geleca.Component.Data
{
	import flash.display.Sprite;
	import flash.system.System;
	import Geleca.Component.Component;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class DataView extends Component implements IBindable
	{
		private var _dataSource						:Object;
		
		public function DataView(asset:Sprite) 
		{
			super(asset);
		}
		
		public final function dataBind():void 
		{
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
			
			System.gc();
			
			super.destroy();
		}
		
	}

}