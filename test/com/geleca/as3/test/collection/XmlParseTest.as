package com.geleca.as3.test.collection
{
	import com.geleca.as3.collection.List;
	import com.geleca.as3.collection.parse.XmlParse;
	import com.geleca.as3.debugger.GLog;

	public class XmlParseTest
	{
		//[Embed(source = "../../../../../../deploy/xml/data/orm.xml",  mimeType="application/octet-stream")]
		private var _data			:Class;
		
		public function XmlParseTest()
		{
			
		}
		
		public function run():void
		{
			var data:XMLList = XML(new _data()).client.client;
			var list:List = new XmlParse().parse(data, ClientVO, {"id":"id", "name":"name", "phone":"phone"}, XmlParse.NAVIGATION_ATTRIBUTES);
			
			for (var i:int = 0; i < list.length; i++) 
			{
				trace(ClientVO(list.getAt(i)).name);
			}
		}
	}
}