package com.geleca.as3.test.website.model.vo
{	

	import com.geleca.as3.data.entity.AbstractFileEntity;

	public class ProductVO extends Object
	{
		public var id				:uint;
		public var name				:String;
		public var price			:String;
		public var photo			:AbstractFileEntity;

		public function ProductVO()
		{
			super();
			
			photo = new AbstractFileEntity();
		}

	}
}