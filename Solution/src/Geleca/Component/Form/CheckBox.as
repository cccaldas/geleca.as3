package Geleca.Component.Form 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import Geleca.Events.InputEvent;
	
	public class CheckBox extends Input
	{
		private var _checked                    :Boolean = false;
		private var _value                      :String = "";
		
		public function CheckBox(asset:Sprite) 
		{
			super(asset);
		}
		
		override protected function setListeners():void 
		{
			_asset.addEventListener(MouseEvent.CLICK, checkBox_click);
			
			super.setListeners();
		}
		
		public function get checked():Boolean { return _checked; }
		
		public function set checked(value:Boolean):void 
		{
			if (value != _checked)
			{
				_checked = value;
				
				if (value) 
				{
					status_checked();
					dispatchEvent(new InputEvent(InputEvent.CHECK));
				}
				else
				{
					status_unchecked();
					dispatchEvent(new InputEvent(InputEvent.UNCHECK));
				}
			}
		}
		
		protected function get textField() :TextField { return TextField(_asset.getChildByName("txt_label")); }
		
		public function get label():String { return textField.text; }
		
		public function set label(value:String):void 
		{
			textField.text = value;
		}
		
		public function get value():String { return _value; }
		
		public function set value(value:String):void 
		{
			_value = value;
		}
		
		protected function status_checked():void 
		{
			
		}
		
		protected function status_unchecked():void 
		{
			
		}
		
		protected function checkBox_click(e:MouseEvent):void 
		{
			checked = !checked;
		}
		
		override public function destroy():void 
		{
			_asset.removeEventListener(MouseEvent.CLICK, checkBox_click);
			
			super.destroy();
		}
		
	}

}