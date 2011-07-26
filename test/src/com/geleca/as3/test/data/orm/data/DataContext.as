package com.geleca.as3.test.data.orm.data
{
	import com.geleca.as3.data.DataTable;
	import com.geleca.as3.data.XmlDataAdapter;
	import com.geleca.as3.data.entity.EntityManager;
	import com.geleca.as3.data.entity.EntitySet;
	import com.geleca.as3.data.entity.EntitySetRelationship;
	import com.geleca.as3.data.entity.EntitySetSettings;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.events.EntitySetEvent;
	import com.geleca.as3.test.data.orm.domain.vo.ClientPhotoVO;
	import com.geleca.as3.test.data.orm.domain.vo.ClientVO;
	import com.geleca.as3.test.data.orm.domain.vo.CountryVO;
	
	import flash.events.Event;
	
	public class DataContext extends EntityManager
	{
		private static var _instance		:DataContext = null;
		
		public var client					:EntitySet;
		public var client_photo				:EntitySet;
		public var country					:EntitySet;
		
		public function DataContext(enforcer:SingletonEnforcer) 
		{
			client = createSet("client",
				new EntitySetSettings(ClientVO,
					new DataTable(["id", "name", "phone", "country_id"], "id"),
					{ "id":"id", "name":"name", "phone":"phone", "country_id":"country_id"} )
			);
			
			client_photo = createSet("client_photo",
				new EntitySetSettings(ClientPhotoVO, 
					new DataTable(["id", "client_id", "src"],"id"),
					{"id":"id", "client_id":"client_id", "src":"src"})
			);
			
			country = createSet("country",
				new EntitySetSettings(CountryVO, 
					new DataTable(["id", "name"],"id"),
					{"id":"id", "name":"name"})
			);
			
			client.addRelationship(new EntitySetRelationship("id", "client_id", 	client_photo, 	EntitySetRelationship.ONE_TO_MANY, 	"photos", true));
			client.addRelationship(new EntitySetRelationship("country_id", 	"id", 	country, 		EntitySetRelationship.ONE_TO_ONE, 	"country", false));
			
			client.addEventListener(EntitySetEvent.UPDATE, client_update);
		}
		
		private function client_update(e:EntitySetEvent):void
		{
			// TODO Auto-generated method stub
			GLog.log(e.data);
		}
		
		public function fill(data:XML):void
		{
			client.settings.dataTable.appendData(new XmlDataAdapter(data.client.client, 		XmlDataAdapter.NAVIGATION_ATTRIBUTES));
			country.settings.dataTable.appendData(new XmlDataAdapter(data.country.country, 		XmlDataAdapter.NAVIGATION_ATTRIBUTES));
			client_photo.settings.dataTable.appendData(new XmlDataAdapter(data.photo.photo, 	XmlDataAdapter.NAVIGATION_ATTRIBUTES));
		}
		
		public static function getInstance():DataContext
		{
			if (_instance == null)
				_instance = new DataContext(new SingletonEnforcer());
			
			return _instance;
		}
	}
}

class SingletonEnforcer {}