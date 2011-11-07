package com.geleca.as3.test.data.orm
{
	import com.geleca.as3.data.XmlDataAdapter;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.test.Assert;
	import com.geleca.as3.test.data.orm.data.DataContext;
	import com.geleca.as3.test.data.orm.domain.vo.ClientVO;
	import com.geleca.as3.test.data.orm.model.ORMModel;

	public class ORMXmlTest
	{
		//[Embed(source = "../../../../../../../deploy/xml/data/orm.xml",  mimeType="application/octet-stream")]
		private var _xmlData		:Class;
		private var _xml			:XML;
		private var _context		:DataContext;
		
		public function ORMXmlTest()
		{
			_xml = XML(new _xmlData());
			_context = DataContext.getInstance();
		}
		
		public function run():void
		{
			GLog.log();
			
			_context.fill(_xml);
			
			Assert.assertEquals(new ORMModel().getClients().length, 8);
			
			GLog.log(new ORMModel().getClients()[0].country.name);
			
			var client:ClientVO = new ORMModel().getClient(2);
			client.name = "Cristiano";
			
			new ORMModel().updateClient(client);
			//GLog.log("getClients", new ORMModel().getClients());
		}
	}
}