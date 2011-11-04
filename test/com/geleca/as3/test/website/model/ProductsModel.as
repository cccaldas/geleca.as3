package com.geleca.as3.test.website.model
{	
	import com.geleca.as3.mvc.core.MVCModel;
	import com.geleca.as3.test.website.App;
	import com.geleca.as3.test.website.model.vo.ProductVO;
	import com.geleca.as3.debugger.GLog;
	
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
			var product:ProductVO;
			
			for each (var item:Object in data)
			{
				product 		= new ProductVO();
				product.id 		= item.id;
				product.name 	= item.name;
				product.price 	= item.price;
				product.photo.src = app.config["path_upld"] + "products/" + product.id.toString() + ".jpg";
				products.push(product);
			}
			
			return products;
		}

	}
}