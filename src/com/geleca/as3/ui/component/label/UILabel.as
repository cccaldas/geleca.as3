package com.geleca.as3.ui.component.label 
{
	import com.geleca.as3.ui.component.UIComponent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class UILabel extends UIComponent
	{
		private var _text				:String = "";
		
		public function UILabel(skin:Class=null) 
		{
			super(skin);
		}
		
		public function get text():String { return _text; }
		
		public function set text(value:String):void 
		{
			_text = value;
			
			updateText();
		}
		
		protected function updateText():void 
		{
			
		}
		
	}

}