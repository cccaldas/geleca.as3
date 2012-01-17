package com.geleca.as3.validation
{
	import com.geleca.as3.component.form.Input;
	import com.geleca.as3.component.form.TextInput;

	public class TextInputEmailValidator extends Object implements IValidator
	{
		private var _input							:Input;
		
		public function TextInputEmailValidator()
		{
			super();
		}
		
		public function set input(value:Input):void
		{
			_input = value;
		}
		
		public function isValid():Boolean
		{
			return !(TextInput(_input).text.length <= 8 || TextInput(_input).text.indexOf("@", 0) == -1 || TextInput(_input).text.indexOf(".", 0) == -1);
		}
	
	}

}