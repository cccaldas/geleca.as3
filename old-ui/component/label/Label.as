package simbionte.ui.component.label 
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import simbionte.ui.component.Component;
	
	public class Label extends Component
	{
		private var _textField				:TextField = new TextField();
		
		public function Label() 
		{
			
		}
		
		override protected function setAssets():void 
		{
			addChild(textField);
			textField.autoSize 		= TextFieldAutoSize.LEFT;
			
			super.setAssets();
		}
		
		override protected function setVariables():void 
		{
			textField.selectable 	= false;
			
			super.setVariables();
		}
		
		public function set selectable(value:Boolean):void 
		{
			textField.selectable = value;
		}
		
		public function set text(value:String):void 
		{
			textField.text = value;
		}
		
		public function get text():String { return textField.text; }
		
		public function set htmlText(value:String):void 
		{
			textField.htmlText = value;
		}
		
		public function get htmlText():String { return textField.htmlText; }
		
		public function get selectable()	:Boolean 	{ return textField.selectable; }
		public function get textField()		:TextField 	{ return _textField; }
		
		override public function destroy():void 
		{
			_textField = null;
			
			super.destroy();
		}
		
	}

}