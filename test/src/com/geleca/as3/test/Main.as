package com.geleca.as3.test
{
	import com.geleca.as3.test.collection.CollectionTest;
	import com.geleca.as3.test.collection.XmlParseTest;
	import com.geleca.as3.test.configuration.ConfigurationTest;
	import com.geleca.as3.test.data.orm.ORMXmlTest;
	import com.geleca.as3.test.debugger.DebuggerTest;
	import com.geleca.as3.test.gloader.GLoaderTest;
	import com.geleca.as3.test.gml.GMLTest;
	import com.geleca.as3.test.i18n.LangTest;
	import com.geleca.as3.test.ui.VideoPlayerTest;
	import com.geleca.as3.test.util.ArrayUtilTest;
	import com.geleca.as3.test.util.DateUtilTest;
	import com.geleca.as3.test.util.DrawUtilTest;
	import com.geleca.as3.test.util.FunctionUtilTest;
	import com.geleca.as3.test.util.OSUtilTest;
	import com.geleca.as3.test.util.PlayerUtilTest;
	import com.geleca.as3.test.util.StatsMonitorTest;
	import com.geleca.as3.test.util.TransformUtilTest;
	import com.geleca.as3.test.video.VideoTest;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	[SWF(frameRate="55", width="1002",height="600")]
	public class Main extends Sprite
	{
		public function Main()
		{
			stage.align 	= StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			//new DebuggerTest().run();
			//new ArrayUtilTest().run();
			//new DateUtilTest().run();
			//new FunctionUtilTest().run();
			//new TransformUtilTest().run(stage);
			//new PlayerUtilTest().run();
			//new OSUtilTest().run();
			//new ConfigurationTest().run();
			//new CollectionTest().run();
			//new ORMXmlTest().run();
			//new XmlParseTest().run();
			//new VideoTest().run(stage);
			new StatsMonitorTest().run(stage);
			//new DrawUtilTest().run(stage);
			//new GMLTest().run(stage);
			//new GLoaderTest().run(stage);
			//new LangTest().run();
			//new VideoPlayerTest().run(stage);
		}
	}
}