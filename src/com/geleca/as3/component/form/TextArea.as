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
		
		override public function init():void 
		{
			super.init();
			
			txt_textInput.multiline = true;
			txt_textInput.height = bg_textInput.height - (txt_textInput.y * 2);
		}
		
		public function set wordWrap(value:Boolean):void 
		{
			txt_textInput.wordWrap = value
		}
		
		public function get wordWrap():Boolean { return txt_textInput.wordWrap; }
		
	}

}