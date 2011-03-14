package com.geleca.as3.configuration 
{
	import com.adobe.utils.StringUtil;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class FlashConfig
	{
		private var _xml		:XML;
		
		public function FlashConfig(xml:XML=null) 
		{
			if (xml)
				parse(xml);
		}
		
		public function parse(xml:XML):void 
		{
			_xml = xml;
		}
		
		/*public function getAppKey(keyName:String):String
		{
			if (!_xml)
				return null;
				
			return _xml.configuration.keys.key.(@name == keyName).@value;
		}*/
		
		public function getAppKey(keyName:String):String
		{
			if (!_xml)
				return null;
			
			var value:String = _xml.configuration.keys.key.(@name == keyName).@value;
			
			//Check Concatenate
			var list:XMLList = _xml.configuration.keys.key;
			var length:uint = list.length();
			
			for (var i:int = 0; i < length; i++) 
			{
				value = StringUtil.replace(value, "{" + _xml.configuration.keys.key[i].@name + "}", _xml.configuration.keys.key[i].@value);
			}
			
			return value;
		}
		
	}

}