package com.geleca.as3.test.data.orm.domain.vo
{
	public class ClientVO
	{
		public var id			:uint;
		public var name			:String;
		public var phone		:String;
		public var photos		:Array = [];
		public var country_id	:uint;
		public var country		:CountryVO;
		
		public function ClientVO() 
		{
			
		}
		
	}

}