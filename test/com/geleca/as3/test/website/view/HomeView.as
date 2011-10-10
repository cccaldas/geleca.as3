package com.geleca.as3.test.website.view
{	
	import flash.text.TextField;
	import com.geleca.as3.mvc.core.MVCView;
	import com.geleca.as3.loading.AssetLoaderItem;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.FileLoaderItem;
	import dupin.parsers.yaml.YAML;
	import flash.text.TextFieldAutoSize;
	
	public class HomeView extends MVCView
	{

		public function HomeView()
		{
			super();
		}
		
		override public function load():void
		{
			loader.addLoaderItem(new FileLoaderItem("lang", app.config["path_lang"] + "pt-br/home.yaml"));
			
			super.load();			
		}
		
		override public function setup():void
		{
			super.setup();
			
			var lang:* = YAML.decode(loader.getItem("lang"));
			
			var txt_description:TextField = new TextField();
			txt_description.autoSize = TextFieldAutoSize.LEFT;
			txt_description.multiline = true;
			txt_description.htmlText = lang["description"];
			
			addChild(txt_description);
		}
		
		public function index():void
		{
			
		}

	}
}