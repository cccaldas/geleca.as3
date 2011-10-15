package com.geleca.as3.test.website.model
{	
	import com.geleca.as3.mvc.core.MVCModel;
	import com.geleca.as3.test.website.App;
	
	public class ProductsModel extends MVCModel
	{

		public function ProductsModel(data:*)
		{
			super(App.getInstance());
			
			this.data = data;
		}
		
		public function getProducts():Array
		{
			var products:Array = [];
			
			
			
			return products;
		}

	}
}