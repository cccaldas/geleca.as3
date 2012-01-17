package com.geleca.as3.component.form
{
	import flash.display.Sprite;
	import com.geleca.as3.component.Component;
	import com.geleca.as3.validation.IValidator;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Input extends Component
	{
		private var _valid					:Boolean = true;
		private var _validator				:IValidator;
		
		public function Input(asset:Sprite) 
		{
			super(asset);
		}
		
		public function set validator(value:IValidator):void
		{
			_validator 			= value;
			_validator.input 	= this;
		}
		
		public function get valid():Boolean { return _valid; }
		
		public function set valid(value:Boolean):void 
		{
			if (_valid != value)
			{
				_valid = value;
				
				if(value)
					status_valid();
				else
					status_invalid();
			}
		}
		
		protected function status_valid():void 
		{
			
		}
		
		protected function status_invalid():void 
		{
			
		}
		
		public function validate():Boolean
		{
			if(_validator)
				valid = _validator.isValid();
				
			return valid;
		}
		
		public function reset():void
		{
			
		}
		
	}

}