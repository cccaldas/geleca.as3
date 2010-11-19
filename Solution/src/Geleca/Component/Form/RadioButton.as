package Geleca.Component.Form 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
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