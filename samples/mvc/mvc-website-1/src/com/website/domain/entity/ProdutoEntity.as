package com.website.domain.entity
{
	import com.geleca.as3.data.entity.AbstractFileEntity;
	import com.geleca.as3.type.Currency;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProdutoEntity
	{
		public var id			:uint;
		public var nome			:String;
		public var preco		:String;
		
		public var thumb		:AbstractFileEntity;
		
		public function ProdutoEntity() 
		{
			
		}
		
	}

}