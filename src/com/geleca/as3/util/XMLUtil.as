package com.geleca.as3.util 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class XMLUtil
	{
		
		public function XMLUtil() 
		{
			
		}
		
		public static function removeNamespaces(xml:XML):XML
		{
			var pattern:RegExp = new RegExp("xmlns[^\"]*\"[^\"]*\"", "gi");
			return XML(xml.toXMLString().replace(pattern, ""));
		}
		
	}

}