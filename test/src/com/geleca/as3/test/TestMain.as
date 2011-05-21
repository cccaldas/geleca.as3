package com.geleca.as3.test
{
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
	public class TestMain extends Sprite
	{
		public function TestMain()
		{
			stage.align 	= StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			//new ArrayUtilTest().run();
			//new DateUtilTest().run();
			//new FunctionUtilTest().run();
			//new TransformUtilTest().run(stage);
			//new PlayerUtilTest().run();
			new OSUtilTest().run();
			
		}
	}
}