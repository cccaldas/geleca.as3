package com.geleca.as3.validation
{
	import com.geleca.as3.component.Combobox;
	import com.geleca.as3.validation.IValidator;
	import com.geleca.as3.component.form.Input;

	public class ComboboxValidator extends Object implements IValidator
	{
		private var _input						:Combobox;
		
		public function ComboboxValidator(input:Combobox)
		{
			super();
			
			_input = input;
		}
		
		public function set input(value:Input):void
		{
			_input = Combobox(value);
		}
		
		public function isValid():Boolean
		{
			return _input.selectedIndex != -1;
		}
	
	}

}