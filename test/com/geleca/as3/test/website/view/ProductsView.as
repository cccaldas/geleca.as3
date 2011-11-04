package com.geleca.as3.test.website.view
{	
	import flash.text.TextField;
	import com.geleca.as3.mvc.core.MVCView;
	import com.geleca.as3.loading.AssetLoaderItem;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.FileLoaderItem;
	import dupin.parsers.yaml.YAML;
	import flash.text.TextFieldAutoSize;
	import flash.display.Bitmap;
	import com.geleca.as3.test.website.model.vo.ProductVO;
	
	public class ProductsView extends MVCView
	{

		public function ProductsView()
		{
			super();
		}
		
		override public function load():void
		{

			
			super.load();			
		}
		
		override public function setup():void
		{
			super.setup();
			
			var lang:* = viewData["lang"];
			
			var txt_description:TextField = new TextField();
			txt_description.autoSize = TextFieldAutoSize.LEFT;
			txt_description.multiline = true;
			txt_description.htmlText = lang["description"];
			txt_description.htmlText += "<br />";
			
			for each (var product:ProductVO in viewData["products"])
			{
				var photo:Bitmap = product.photo.data;
				photo.x = 132 * product.id;
				photo.y = 100;
				addChild(photo)
				txt_description.htmlText += product["price"] + ": " + product["name"] + "<br />";
			}
				
			
			addChild(txt_description);
		}
		
		public function index():void
		{
			
		}

	}
}