package com.geleca.as3.component.form
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class TextArea extends TextInput
	{
		
		public function TextArea(asset:Sprite)
		{
			super(asset);
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			textField.multiline = true;
			textField.height = background.height - (textField.y * 2);
		}
		
		public function set wordWrap(value:Boolean):void 
		{
			textField.wordWrap = value
		}
		
		public function get wordWrap():Boolean { return textField.wordWrap; }
		
	}

}