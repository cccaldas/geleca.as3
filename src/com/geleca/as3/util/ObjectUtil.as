package com.geleca.as3.util 
{
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ObjectUtil
	{
		
		public function ObjectUtil() 
		{
			
		}
		
		public static function getClassByObject(object:Object):Class
		{
			return Class(object.constructor);
		}
		
		public static function getClassByName(className:String):Class
		{
			return getDefinitionByName(className) as Class;
		}
		
		public static function getObjectByClassName(className:String):*
		{
			return new (getDefinitionByName(className) as Class)();
		}
		
	}

}