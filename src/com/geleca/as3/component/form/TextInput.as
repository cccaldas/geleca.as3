package com.geleca.as3.component.form 
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
	public class TextInput extends Input
	{
		private var _padding				:Number = 0;
		
		public function TextInput(asset:Sprite) 
		{
			super(asset);
		}
		
		public function get bg_textInput()	:Sprite 	{ return asset["bg_textInput"]; }
		public function get txt_textInput()	:TextField 	{ return asset["txt_textInput"]; }
		
		override public function setup():void 
		{
			super.setup();
			
			_padding 	= (txt_textInput.x + txt_textInput.y) * .5;
			
			var width:Number = this.width;
			var height:Number = this.height;
			
			asset.scaleX 	= asset.scaleY = 1;
			this.width 		= width;
			this.height 	= height;
			
			asset.addEventListener(FocusEvent.FOCUS_OUT, 	textInput_focusOut);
			
			asset.addEventListener(MouseEvent.ROLL_OVER, 	asset_rollOver);
			asset.addEventListener(MouseEvent.ROLL_OUT, 	asset_rollOut);
		}
		
		private function asset_rollOver(e:MouseEvent):void 
		{
			rollOver();
		}
		
		private function asset_rollOut(e:MouseEvent):void 
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
			if (bg_textInput)
			{
				bg_textInput.width 	= value;
				applyPadding();
			}
			else txt_textInput.width = value;
		}
		
		override public function set height(value:Number):void 
		{
			if (bg_textInput)
			{
				bg_textInput.height 	= value;
				applyPadding();
			}
			else txt_textInput.height = value;
		}
		
		public function set text(value:String):void 
		{
			txt_textInput.text = value;
		}
		
		//Calcula o padding do textField
		private function applyPadding():void 
		{
			if (bg_textInput)
			{
				txt_textInput.x 		= padding;
				txt_textInput.width 	= bg_textInput.width - (padding * 2);
				
				txt_textInput.y 		= padding;
				txt_textInput.height 	= bg_textInput.height - (padding * 2);
				
				bg_textInput_resize();
			}
		}
		
		protected function bg_textInput_resize():void
		{
			
		}
		
		public function get text():String { return txt_textInput.text; }
		
		override protected function focusIn():void 
		{
			super.focusIn();
			
			stage.focus = txt_textInput;
		}
		
		private function textInput_focusOut(e:FocusEvent):void 
		{
			if (valid)
				focusOut();
			else
				status_invalid();
			
			e.stopImmediatePropagation();
		}
		
		override public function get tabIndex():int { return txt_textInput.tabIndex; }
		
		override public function set tabIndex(value:int):void 
		{
			txt_textInput.tabIndex = value;
		}
		
		public function get maxChars():int { return txt_textInput.maxChars; }
		public function set maxChars(value:int):void 
		{
			txt_textInput.maxChars = value;
		}
		
		public function setSelection(beginIndex:int, endIndex:int):void 
		{
			txt_textInput.setSelection(beginIndex, endIndex);
		}
		
		public function selectText():void 
		{
			focusIn();
			txt_textInput.setSelection(0, txt_textInput.text.length + 1);
		}
		
		public function get restrict():String { return txt_textInput.restrict; }
		public function set restrict(value:String):void 
		{
			txt_textInput.restrict = value;
		}
		
		public function get padding():Number { return _padding; }
		
		public function get displayAsPassword():Boolean
		{
			return txt_textInput.displayAsPassword;
		}
		
		public function set displayAsPassword(value:Boolean):void
		{
			txt_textInput.displayAsPassword = value;
		}
		
		override public function reset():void
		{
			this.text = "";
		}
		
		override public function destroy():void 
		{
			asset.removeEventListener(FocusEvent.FOCUS_OUT, 	textInput_focusOut);
			
			asset.removeEventListener(MouseEvent.ROLL_OVER, 	asset_rollOver);
			asset.removeEventListener(MouseEvent.ROLL_OUT, 		asset_rollOut);
			
			super.destroy();
		}
	}

}