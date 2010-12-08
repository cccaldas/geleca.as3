package Geleca.Configuration 
{
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
		
		public function getAppKey(keyName:String):String
		{
			if (!_xml)
				return null;
				
			return _xml.Configuration.AppKeys.Key.(@Name == keyName).@Value;
		}
		
	}

}