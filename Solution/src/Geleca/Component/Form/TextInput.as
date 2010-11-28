package Geleca.Component.Form 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	public class TextInput extends Input
	{
		private var _textField				:TextField = new TextField();
		private var _background				:Sprite;
		private var _padding				:Number = 0;
		
		public function TextInput(asset:Sprite) 
		{
			super(asset);
			
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			_background = Sprite(_asset.getChildByName("bg_textInput"));
			_textField	= TextField(_asset.getChildByName("txt_textInput"));
			_padding 	= (_textField.x + _textField.y) * .5;
			
			var width:Number = this.width;
			var height:Number = this.height;
			
			_asset.scaleX 	= _asset.scaleY = 1;
			this.width 		= width;
			this.height 	= height;
			
			_asset.addEventListener(FocusEvent.FOCUS_OUT, 	textInput_focusOut);
		}
		
		override public function set width(value:Number):void 
		{
			if (background)
			{
				background.width 	= value;
				applyPadding();
			}
			else textField.width = value;
		}
		
		override public function set height(value:Number):void 
		{
			if (background)
			{
				background.height 	= value;
				applyPadding();
			}
			else textField.height = value;
		}
		
		public function set text(value:String):void 
		{
			textField.text = value;
		}
		
		//Calcula o padding do textField
		private function applyPadding():void 
		{
			if (background)
			{
				textField.x 		= padding;
				textField.width 	= background.width - (padding * 2);
				
				textField.y 		= padding;
				textField.height 	= background.height - (padding * 2);
			}
		}
		
		public function get text():String { return textField.text; }
		
		public function get textField():TextField
		{
			return _textField;
		}
		
		public function get background():Sprite
		{
			return _background;
		}
		
		override protected function focusIn():void 
		{
			super.focusIn();
			
			stage.focus = textField;
		}
		
		private function textInput_focusOut(e:FocusEvent):void 
		{
			if (valid)
				focusOut();
			else
				status_invalid();
			
			e.stopImmediatePropagation();
		}
		
		override public function get tabIndex():int { return textField.tabIndex; }
		
		override public function set tabIndex(value:int):void 
		{
			textField.tabIndex = value;
		}
		
		public function get maxChars():int { return textField.maxChars; }
		public function set maxChars(value:int):void 
		{
			textField.maxChars = value;
		}
		
		public function setSelection(beginIndex:int, endIndex:int):void 
		{
			textField.setSelection(beginIndex, endIndex);
		}
		
		public function selectText():void 
		{
			focusIn();
			textField.setSelection(0, textField.text.length + 1);
		}
		
		public function get restrict():String { return textField.restrict; }
		public function set restrict(value:String):void 
		{
			textField.restrict = value;
		}
		
		public function get padding():Number { return _padding; }
		
		override public function destroy():void 
		{
			_asset.removeEventListener(FocusEvent.FOCUS_OUT, 	textInput_focusOut);
			
			_textField 		= null;
			_background 	= null;
			
			super.destroy();
		}
	}

}