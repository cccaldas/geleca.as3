package Domain.Entity
{
	public class ClientEntity
	{
		public var id			:uint;
		public var name			:String;
		public var phone		:String;
		public var photos		:Array = [];
		public var countryID	:uint;
		public var country		:CountryEntity;
		
		public function ClientEntity() 
		{
			
		}
		
	}

}