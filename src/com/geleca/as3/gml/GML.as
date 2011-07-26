package com.geleca.as3.gml
{
	public class GML
	{
		private var _data	:XML;
		
		public function GML(data:XML)
		{
			_data = data;
		}

		public function get data():XML
		{
			return _data;
		}

	}
}