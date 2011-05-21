package com.geleca.as3.ui.component.label 
{
	import com.geleca.as3.ui.component.Component;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Label extends Component
	{
		private var _text				:String = "";
		
		public function Label(skin:Class=null) 
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