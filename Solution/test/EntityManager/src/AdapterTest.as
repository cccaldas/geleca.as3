package  
{
	import Simbionte.Data.XmlDataAdapter;
	/**
	 * ...
	 * @author 
	 */
	public class AdapterTest
	{
		[Embed(source = "../data/data.xml",  mimeType="application/octet-stream")]
		private var _data		:Class;
		private var data		:XML;
		
		public function AdapterTest() 
		{
			data = XML(new _data());
		}
		
		public function run():void 
		{
			//new XmlDataAdapter(data.client.client, XmlDataAdapter.NAVIGATION_ATTRIBUTES);
			new XmlDataAdapter(data.client.client, XmlDataAdapter.NAVIGATION_NODES).getData();
			
			//XML().attributes()
		}
		
	}

}