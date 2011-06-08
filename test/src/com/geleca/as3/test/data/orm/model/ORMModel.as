package com.geleca.as3.test.data.orm.model
{
	import com.geleca.as3.test.data.orm.data.DataContext;
	import com.geleca.as3.test.data.orm.domain.vo.ClientVO;

	public class ORMModel
	{
		public function ORMModel()
		{
			
		}
		
		public function getClients():Vector.<ClientVO>
		{
			return Vector.<ClientVO>(DataContext.getInstance().client.all());
		}
		
		public function updateClient(client:ClientVO):void
		{
			DataContext.getInstance().client.update(client);
		}
		
		public function getClient(id:uint):ClientVO
		{
			return DataContext.getInstance().client.byPK(id);
		}
	}
}