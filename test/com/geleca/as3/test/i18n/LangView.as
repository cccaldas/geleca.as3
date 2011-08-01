package com.geleca.as3.test.i18n
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.AssetLoaderItem;
	import com.geleca.as3.loading.FileLoaderItem;
	import com.geleca.as3.loading.LangLoaderItem;
	import com.geleca.as3.mvc.core.View;
	
	public class LangView extends View
	{
		public function LangView()
		{
			super();
		}
		
		override public function load():void
		{
			// TODO Auto Generated method stub
			//loader.addLoaderItem(new LangLoaderItem("lang/pt-br/main.xml"));
			loader.addLoaderItem(new FileLoaderItem("data", "xml/data/orm.xml"));
			
			GLog.log();
			
			super.load();
		}
		
		override protected function setup():void
		{
			// TODO Auto Generated method stub
			super.setup();
			
			//GLog.log(lang["key-1"]);
		}
		
		override protected function initialize():void
		{
			// TODO Auto Generated method stub
			super.initialize();
			
			GLog.log();
		}
		
	}
}