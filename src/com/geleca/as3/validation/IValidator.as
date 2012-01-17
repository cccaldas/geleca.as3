package com.geleca.as3.validation
{
import com.geleca.as3.component.form.Input;

	public interface IValidator
	{
		function set input(value:Input):void
		function isValid():Boolean;
	}

}