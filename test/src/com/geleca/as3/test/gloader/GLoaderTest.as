package com.geleca.as3.test.gloader
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.AssetLoaderItem;
	import com.geleca.as3.loading.GLoader;
	import com.geleca.as3.mvc.core.View;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.ProgressEvent;

	public class GLoaderTest
	{
		public function GLoaderTest()
		{
			
		}
		
		public function run(stage:Stage):void
		{
			var view:View = new View();
			
			view.loader.addLoaderItem(new AssetLoaderItem("image-1", "http://www.all-freeware.com/images/full/47137-magix_photo_clinic_for_free_graphic_apps_editors.jpeg"));
			view.loader.addLoaderItem(new AssetLoaderItem("image-2", "http://www.suggestsoft.com/images/morpheus-software/morpheus-photo-animation-suite.gif"));
			view.loader.addLoaderItem(new AssetLoaderItem("image-3", "http://i1-win.softpedia-static.com/screenshots/Acdsee-Photo-Editor_1.png"));
			view.loader.addLoaderItem(new AssetLoaderItem("skin", "http://www.itamaratyhall.com.br/swf/skin/appview.swf"));
			
			
			
			view.loader.addEventListener(ProgressEvent.PROGRESS, loader_progress);
			view.loader.addEventListener(Event.COMPLETE, loader_complete);
			
			view.loader.load();
			
			function loader_complete(event:Event):void
			{
				// TODO Auto-generated method stub
				GLog.log("complete");
			}
			
			function loader_progress(event:Event):void
			{
				// TODO Auto-generated method stub
				GLog.log(view.loader.progress);	
			}
		}
		
		
	}
}