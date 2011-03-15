package  
{
	import Domain.DAO.ClientDAO;
	import Domain.Data.Entities;
	import Domain.Entity.ClientEntity;
	import Domain.Entity.ClientPhotoEntity;
	import Domain.Entity.CountryEntity;
	import Domain.Facade.Facade;
	import flash.utils.getTimer;
	import Simbionte.Data.XmlDataAdapter;
	/**
	 * ...
	 * @author 
	 */
	public class EntityTest
	{
		[Embed(source = "../data/data.xml",  mimeType="application/octet-stream")]
		private var _data		:Class;
		private var data		:XML;
		
		private var entities:Entities;
		
		public function EntityTest() 
		{
			data = XML(new _data());
		}
		
		public function run():void 
		{
			entities = Facade.getInstance().entities;
			
			//Countries
			entities.Countries.settings.dataTable.appendData(new XmlDataAdapter(data.country.country, XmlDataAdapter.NAVIGATION_ATTRIBUTES));
			
			//Clients
			entities.Clients.settings.dataTable.appendData(new XmlDataAdapter(data.client.client, XmlDataAdapter.NAVIGATION_ATTRIBUTES));
			
			//ClientPhotos
			entities.ClientPhotos.settings.dataTable.appendData(new XmlDataAdapter(data.clientPhoto.clientPhoto, XmlDataAdapter.NAVIGATION_ATTRIBUTES));					
			
			//var client:ClientEntity = ClientEntity(entities.Clients.byPK(6));
			var client:ClientEntity = new ClientEntity();
			client.name = "Cristiano Caldas";
			client.phone = "+55 (27) 3031-3306";
			client.countryID = CountryEntity(entities.Countries.byPK(3)).id;
			for (var i:int = 0; i < 10; i++) 
			{
				var photo:ClientPhotoEntity = new ClientPhotoEntity();
				photo.src = "photo-" + i.toString() + ".jpg";
				client.photos.push(photo);
			}
			
			entities.Clients.insert(client);
			client = ClientEntity(entities.Clients.byPK(client.id));
			reportClient(client);
			/*reportClient(client);
			//reportCountry(CountryEntity(entities.Countries.byPK(3)));
			
			var countries:Array = entities.Countries.where("name", EntityPropertyCompare.LIKE, "y").entities;
			for (var i:int = 0; i < countries.length; i++) 
			{
				reportCountry(CountryEntity(countries[i]));
			}*/
			//trace(this, .length);
			
			/*trace(entities.Countries.length);
			entities.Clients.removeAll();
			trace(entities.Clients.length);
			trace(entities.Countries.length);*/
			/*client.name  = "Cristiano";
			client.phone = "+55 (27) 3031-3306";
			
			entities.Clients.insert(client);*/
			//trace("Inserted ", client.id);
			
			//reportLength();
			//reportClient(entities.Clients.all()[entities.Clients.length - 1]);
			
			//Insere 1 Cliente
			/*client = new ClientEntity();
			client.name  = "Simbionte Studios";
			client.phone = "+55 (27) 3031-3306";*/
			
			//entities.Clients.insert(client);
			//trace("Inserted ", client.id);
			
			//Atualiza
			//trace(this, "atualiza", client.id);
			//client.name = "Simbionte Studios - Updated";
			//entities.Clients.update(client);
			
			//reportClient(entities.Clients.all()[entities.Clients.length - 1]);
			//reportClient(ClientEntity(entities.Clients.byPK(client.id)));
			
			/*trace(this, "Photos", entities.ClientPhotos.length);
			client = ClientEntity(entities.Clients.byPK(1));
			reportClient(client);
			
			entities.Clients.remove(client);
			trace(this, "Photos", entities.ClientPhotos.length);*/
			
		}
		
		private function reportCountry(country:CountryEntity):void 
		{
			trace(this, "ReportCountry: ", country.id, country.name);
		}
		
		private function reportClient(client:ClientEntity):void 
		{
			trace(this, "ReportClient: ", client.id, client.name, client.phone, client.photos, client.country.name);
		}
		
		private function reportLength():void 
		{
			//trace(this, "reportLength", entities.Clients.all().length);
		}
		
	}

}