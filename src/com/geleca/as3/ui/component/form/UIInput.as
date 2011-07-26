package com.geleca.as3.ui.component.form
{
	import com.geleca.as3.ui.component.UIComponent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class UIInput extends UIComponent
	{
		private var _valid					:Boolean = true;
		
		public function UIInput(skin:Class) 
		{
			super(skin);
		}
		
		public function get valid():Boolean { return _valid; }
		
		public function set valid(value:Boolean):void 
		{
			if (_valid != value)
			{
				_valid = value;
				
				if (value)
					status_valid();
				else
					status_invalid();
			}
		}
		
		protected function status_valid():void 
		{
			
		}
		
		protected function status_invalid():void 
		{
			
		}
		
	}

}