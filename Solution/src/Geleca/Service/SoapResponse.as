package Geleca.Service 
{
	public class SoapResponse
	{
		private var _xml        :XML;
		
		public function SoapResponse(xml:XML) 
		{
			_xml = xml;
		}
		
		public function get xml():XML { return _xml; }
		
		public function get body():XML
		{ 
			var soap :Namespace = _xml.namespace();
			
			return XML(_xml.soap::Body.children());
		}
		
		public function get header():XML
		{ 
			var soap :Namespace = _xml.namespace();
			
			return XML(_xml.soap::Header.children());
		}
		
	}

}