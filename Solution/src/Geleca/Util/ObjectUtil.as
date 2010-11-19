package Geleca.Util 
{
	/**
	 * ...
	 * @author 
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
		
	}

}