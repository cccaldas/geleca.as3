package com.geleca.as3.validation
{
	import com.geleca.as3.component.form.Input;
	import com.geleca.as3.component.form.TextInput;

	public class TextInputLengthValidator extends Object implements IValidator
	{
		private var _input							:Input;
		private var _length							:int;
		
		public function TextInputLengthValidator(length:int)
		{
			super();
			
			_length = length;
		}
		
		public function set input(value:Input):void
		{
			_input = value;
		}
		
		public function isValid():Boolean
		{
			return TextInput(_input).text.length >= _length;
		}
	
	}

}