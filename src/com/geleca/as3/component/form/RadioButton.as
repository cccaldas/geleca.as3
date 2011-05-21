package com.geleca.as3.component.form 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class RadioButton extends CheckBox
	{
		
		public function RadioButton(asset:Sprite) 
		{
			super(asset);
		}
		
		override protected function checkBox_click(e:MouseEvent):void 
		{
			checked = true;
		}
		
	}

}