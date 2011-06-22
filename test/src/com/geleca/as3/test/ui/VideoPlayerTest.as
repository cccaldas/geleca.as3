package com.geleca.as3.test.ui
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.ui.component.video.VideoPlayer;
	
	import flash.display.Stage;
	import flash.events.Event;

	public class VideoPlayerTest
	{
		private var _stage			:Stage;
		private var ctr_video		:VideoPlayer;
		
		public function VideoPlayerTest()
		{
			
		}
		
		public function run(stage:Stage):void
		{
			_stage = stage;
			
			ctr_video = new VideoPlayer(320, 240);
			_stage.addChild(ctr_video);
			ctr_video.initializeComponent();
			
			ctr_video.url = "http://www.brunozanet.com.br/swf/brunozanet.flv";
			
			_stage.addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		protected function enterFrame(event:Event):void
		{
			// TODO Auto-generated method stub
			GLog.log("percentLoaded", ctr_video.percentLoaded);
		}
	}
}