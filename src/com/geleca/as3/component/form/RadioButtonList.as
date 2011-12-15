package com.geleca.as3.component.form 
{
	import flash.display.Sprite;
	import com.geleca.as3.events.InputEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class RadioButtonList extends Input
	{
		private var _radios							:Vector.<RadioButton> = new Vector.<RadioButton>();
		private var _radio							:RadioButton = null //radio selected
		
		public function RadioButtonList() 
		{
			super(new Sprite());
		}
		
		public function addRadio(radio:RadioButton):void 
		{
			radio.addEventListener(InputEvent.CHECK, 	radio_check);
			
			_radios.push(radio);
		}
		
		public function get value():String { return (_radio != null) ? _radio.value : null; }
		
		public function get length():uint { return _radios.length; }
		
		override public function reset():void 
		{
			if(_radios.length != 0)
				_radios[0].checked = true;
		}
		
		private function radio_check(e:InputEvent):void 
		{
			if (_radio)
				_radio.checked = false;
				
			_radio = RadioButton(e.currentTarget);
		}
		
		override public function destroy():void 
		{
			var length	:uint = _radios.length;
			
			for (var i:int = 0; i < length; i++) 
			{
				_radios[i].destroy();
			}
			
			_radios = null;
			
			super.destroy();
		}
	}

}