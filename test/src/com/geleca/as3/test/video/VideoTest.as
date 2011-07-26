package com.geleca.as3.test.video
{
	import com.adobe.fileformats.vcard.Address;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.GLoader;
	import com.geleca.as3.loading.VideoLoaderItem;
	import com.geleca.as3.net.SimpleNetStream;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.media.Video;

	public class VideoTest
	{
		public function VideoTest()
		{
			
		}
		
		public function run(stage:Stage):void
		{
			var loader:GLoader = new GLoader();
			loader.addLoaderItem(new VideoLoaderItem("video", "video.flv", 1, true));
			loader.addEventListener(Event.COMPLETE, loader_complete);
			loader.load();
			
			var video:Video = new Video();
			stage.addChild(video);
			
			function loader_complete(e:Event):void
			{
				var ns:SimpleNetStream = loader.getItem("video");
				trace(this, ns.meta.duration);
				video.attachNetStream(ns);
				ns.seek(0);
				ns.resume();
			}
		}
	}
}