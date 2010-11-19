package Domain.DAO
{
	import Domain.Entity.ClientEntity;
	import Domain.Facade.Facade;
	/**
	 * ...
	 * @author 
	 */
	public class ClientDAO
	{
		
		public function ClientDAO() 
		{
			
		}
		
		public function getClient(id:uint):ClientEntity
		{
			return ClientEntity(Facade.getInstance().entities.Clients.byPK(id));
		}
		
		public function getClients():Vector.<ClientEntity>
		{
			return Vector.<ClientEntity>(Facade.getInstance().entities.Clients.all());
		}
		
	}

}