//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 
// 
////////////////////////////////////////////////////////////////////////////////

package
{

	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
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
	import com.geleca.as3.test.component.ComponentTest;
	import com.geleca.as3.test.yaml.YAMLTest1;
	import com.geleca.as3.test.website.WebsiteTest;

	/**
	 * Application entry point for geleca-framework.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Cristiano Caldas
	 * @since 31.07.2011
	 */

	[SWF(width="1002", height="560", backgroundColor="#FFFFFF", frameRate="60")]
	public class Main extends Sprite
	{	
		/**
		 * @constructor
		 */
		public function Main()
		{
			super();
		
			if(stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}

		/**
		 * Initialize stub.
		 */
		private function init(e:Event=null):void
		{
			stage.align 		= StageAlign.TOP_LEFT;
			stage.scaleMode 	= StageScaleMode.NO_SCALE;
		
			removeEventListener(Event.ADDED_TO_STAGE, init);
		
			//new DebuggerTest().run();
			//new YAMLTest1().run();
			//new ArrayUtilTest().run();
			//new DateUtilTest().run();
			//new FunctionUtilTest().run();
			//new TransformUtilTest().run(stage);
			//new PlayerUtilTest().run();
			//new OSUtilTest().run();
			//new ConfigurationTest().run();
			new WebsiteTest().run(this);
			//new ComponentTest().run(stage);
			//new CollectionTest().run();
			//new ORMXmlTest().run();
			//new XmlParseTest().run();
			//new VideoTest().run(stage);
			//new StatsMonitorTest().run(stage);
			//new DrawUtilTest().run(stage);
			//new GMLTest().run(stage);
			//new GLoaderTest().run(stage);
			//new LangTest().run();
			//new VideoPlayerTest().run(stage);
			
		}
	
	}

}