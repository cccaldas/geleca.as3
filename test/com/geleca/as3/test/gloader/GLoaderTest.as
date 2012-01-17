package com.geleca.as3.test.gloader
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.AssetLoaderItem;
	import com.geleca.as3.loading.GLoader;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.ProgressEvent;

	public class GLoaderTest
	{
		public function GLoaderTest()
		{
			super();
		}
		
		public function run(stage:Stage):void
		{
			var loader:GLoader = new GLoader();
			
			loader.addLoaderItem(new AssetLoaderItem("image-1", "http://www.all-freeware.com/images/full/47137-magix_photo_clinic_for_free_graphic_apps_editors.jpeg"));
			loader.addLoaderItem(new AssetLoaderItem("image-2", "http://www.suggestsoft.com/images/morpheus-software/morpheus-photo-animation-suite.gif", .2));
			loader.addLoaderItem(new AssetLoaderItem("image-3", "http://i1-win.softpedia-static.com/screenshots/Acdsee-Photo-Editor_1.png", .2));
			//loader.addLoaderItem(new AssetLoaderItem("skin", "http://www.itamaratyhall.com.br/swf/skin/appview.swf"));			
			
			loader.addEventListener(ProgressEvent.PROGRESS, loader_progress);
			loader.addEventListener(Event.COMPLETE, 		loader_complete);
			
			loader.load();
			
			function loader_complete(event:Event):void
			{
				trace("GLoaderTest::loader_complete()");
			}
			
			function loader_progress(event:Event):void
			{
				trace("GLoaderTest::loader_progress()", loader.progress);
			}
		}
		
		
	}
}