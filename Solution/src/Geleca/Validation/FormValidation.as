package Geleca.Validation 
{
	import Geleca.Component.Form.TextInput;
	import Geleca.Component.Form.Input;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class FormValidation 
	{
		public static const TYPE_FILE_INPUT						:String = "fileInput";
		public static const TYPE_CHECKBOX_LIST					:String = "checkBoxList";
		
		public static const TYPE_TEXT_INPUT_LENGTH				:String = "textInputLength";
		public static const TYPE_TEXT_INPUT_EMAIL				:String = "textInputEmail";
		
		private var _group               :Array = [];
		
		public function FormValidation() 
		{
			
		}
		
		public function addField(input:Input, validationType:String, parameters:Object=null):void 
		{
			_group.push( { input:input, validationType:validationType, parameters:parameters } );
		}
		
		private function validateInput(input:Input, validationType:String, parameters:Object):Boolean 
		{
			var _return:Boolean = true;
			
			switch (validationType) 
			{
				case TYPE_TEXT_INPUT_LENGTH:
					_return = (TextInput(input).text.length >= int(parameters));
				break;
				
				case TYPE_TEXT_INPUT_EMAIL:
					_return = !(TextInput(input).text.length <= 8 || TextInput(input).text.indexOf("@", 0) == -1 || TextInput(input).text.indexOf(".", 0) == -1);
				break;
				
				/*case TYPE_FILE_INPUT:
					_return = FileInput(input).textField.length != 0;
				break;*/
				
				/*case TYPE_CHECKBOX_LIST:
					_return = CheckBoxList(input).values.length >= int(parameters);
				break;*/
				
				/*case ValidationType.MAILING_NAME:
					if (SimpleMailingTextInput(input).text == SimpleMailingTextInput(input).textMask) 
					{
						_return = false;
					}
					else 
					{
						_return = validateInput(input, ValidationType.TEXT_INPUT_LENGTH, 2);
					}
				break;
				
				case ValidationType.MAILING_EMAIL:
					if (SimpleMailingTextInput(input).text == SimpleMailingTextInput(input).textMask) 
					{
						_return = false;
					}
					else 
					{
						_return = validateInput(input, ValidationType.TEXT_INPUT_EMAIL,null);
					}
				break;*/
			}
			
			/*if (TextInput(input).maskType == TextInputMask.TYPE_TEXT)
			{
				if (TextInput(input).text == TextInput(input).maskText) _return = false;
			}*/
			
			input.valid = _return;
			
			return _return;
		}
		
		public function validate():Boolean 
		{
			var _return:Boolean = true;
			
			for (var i:int = 0; i < _group.length; i++) 
			{
				if (!validateInput(_group[i].input, _group[i].validationType, _group[i].parameters)) _return = false;
				//if (!_return) return _return;
			}
			
			return _return;
		}
		
	}
	
}