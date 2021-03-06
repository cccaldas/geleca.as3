package com.geleca.as3.ui.component.form 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class UITextInput extends UIInput
	{
		private var _textField				:TextField;
		private var _background				:Sprite;
		private var _padding				:Number = 0;
		
		public function UITextInput(skin:Class) 
		{
			super(skin);
			
			_background = Sprite(skin.getChildByName("bg_textInput"));
			_textField	= TextField(skin.getChildByName("txt_textInput"));
		}
		
		override protected function setup():void 
		{
			super.setup();			
			_padding 	= (_textField.x + _textField.y) * .5;
			
			var width:Number = this.width;
			var height:Number = this.height;
			
			//_asset.scaleX 	= _asset.scaleY = 1;
			this.width 		= width;
			this.height 	= height;
			
			addEventListener(FocusEvent.FOCUS_OUT, 	textInput_focusOut);
			
			addEventListener(MouseEvent.ROLL_OVER, 	_rollOver);
			addEventListener(MouseEvent.ROLL_OUT, 	_rollOut);
		}
		
		private function _rollOver(e:MouseEvent):void 
		{
			rollOver();
		}
		
		private function _rollOut(e:MouseEvent):void 
		{
			rollOut();
		}
		
		protected function rollOver():void 
		{
			
		}
		
		protected function rollOut():void 
		{
			
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
		
		public function get displayAsPassword():Boolean
		{
			return textField.displayAsPassword;
		}
		
		public function set displayAsPassword(value:Boolean):void
		{
			textField.displayAsPassword = value;
		}
		
		override public function destroy():void 
		{
			removeEventListener(FocusEvent.FOCUS_OUT, 	textInput_focusOut);
			
			removeEventListener(MouseEvent.ROLL_OVER, 	_rollOver);
			removeEventListener(MouseEvent.ROLL_OUT, 	_rollOut);
			
			_textField 		= null;
			_background 	= null;
			
			super.destroy();
		}
	}

}