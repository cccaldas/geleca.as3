package com.geleca.as3.test
{
	import com.geleca.as3.test.collection.CollectionTest;
	import com.geleca.as3.test.configuration.ConfigurationTest;
	import com.geleca.as3.test.util.ArrayUtilTest;
	import com.geleca.as3.test.util.DateUtilTest;
	import com.geleca.as3.test.util.FunctionUtilTest;
	import com.geleca.as3.test.util.OSUtilTest;
	import com.geleca.as3.test.util.PlayerUtilTest;
	import com.geleca.as3.test.util.TransformUtilTest;
	
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
			
			//new ArrayUtilTest().run();
			//new DateUtilTest().run();
			//new FunctionUtilTest().run();
			//new TransformUtilTest().run(stage);
			//new PlayerUtilTest().run();
			//new OSUtilTest().run();
			//new ConfigurationTest().run();
			new CollectionTest().run();
		}
	}
}