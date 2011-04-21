package simbionte.ui.component.form 
{
	import flash.display.Sprite;
	public class TextArea extends TextInput
	{
		
		public function TextArea(background:Sprite=null, padding:Number = 0)
		{
			super(background, padding);
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