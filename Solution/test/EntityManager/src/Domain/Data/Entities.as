package Domain.Data
{
	import Domain.Entity.ClientEntity;
	import Domain.Entity.ClientPhotoEntity;
	import Domain.Entity.CountryEntity;
	import Simbionte.Data.DataTable;
	import Simbionte.Data.Entity.EntityManager;
	import Simbionte.Data.Entity.EntitySet;
	import Simbionte.Data.Entity.EntitySetRelationship;
	import Simbionte.Data.Entity.EntitySetSettings;
	/**
	 * ...
	 * @author 
	 */
	public class Entities extends EntityManager
	{
		public var Clients					:EntitySet;
		public var ClientPhotos				:EntitySet;
		public var Countries				:EntitySet;
		
		public function Entities() 
		{
			Clients = createSet(	"Clients",
									new EntitySetSettings(ClientEntity,
									new DataTable(["id", "name", "phone", "countryID"], "id"),
									{ "id":"id", "name":"name", "phone":"phone", "countryID":"countryID"} )
								);
								
			ClientPhotos = createSet(	"ClientPhotos",
										new EntitySetSettings(ClientPhotoEntity, 
										new DataTable(["id", "clientID", "src"],"id"),
										{"id":"id", "clientID":"clientID", "src":"src"})
									);
			
			Countries = createSet(	"Countries",
										new EntitySetSettings(CountryEntity, 
										new DataTable(["id", "name"],"id"),
										{"id":"id", "name":"name"})
									);
									
			Clients.addRelationship(new EntitySetRelationship("id", 		"clientID", 	ClientPhotos, 	EntitySetRelationship.ONE_TO_MANY, 	"photos", true));
			Clients.addRelationship(new EntitySetRelationship("countryID", 	"id", 			Countries, 		EntitySetRelationship.ONE_TO_ONE, 	"country", false));
		}
		
	}

}

