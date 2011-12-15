package com.geleca.as3.component
{
	import flash.display.Sprite;
	import com.geleca.as3.component.data.IBindable;
	import flash.system.System;
	import com.geleca.as3.component.form.Input;

	public class Combobox extends Input implements IBindable
	{
		public static const OPEN					:String = "open";
		public static const CLOSE					:String = "close";
		
		private var _selectedIndex					:int = -1;
		private var _dataSource						:Object;
	
		public function Combobox(asset:Sprite)
		{
			super(asset);
		}
		
		public final function open():void
		{
			state = OPEN;
		}
		
		public final function close():void
		{
			state = CLOSE;
		}
		
		public function get selectedIndex():int { return _selectedIndex; }
		public function set selectedIndex(value:int):void
		{
			_selectedIndex = value;
			
			index_change();
		}
		
		protected function index_change():void
		{
			
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
		
		override public function validate():Boolean
		{
			return selectedIndex != -1;
		}
		
		override public function reset():void
		{
			selectedIndex = -1;
		}
		
		override public function destroy():void 
		{
			_dataSource = null;
			
			System.gc();
			
			super.destroy();
		}
	
	}

}