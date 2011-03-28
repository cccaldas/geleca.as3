package com.website.app 
{
	import com.geleca.as3.mvc.core.Router;
	import com.website.app.view.AppLoaderView;
	import com.website.app.view.AppView;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import nl.demonsters.debugger.MonsterDebugger;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	[SWF(frameRate=30)]
	public class Main extends Sprite
	{
		
		public function Main() 
		{
			stage.align 		= StageAlign.TOP_LEFT;
			stage.scaleMode 	= StageScaleMode.NO_SCALE;
			
			new MonsterDebugger(this);
			MonsterDebugger.clearTraces();
			App.getInstance().startup(this, new AppLoaderView(), new AppView(), new Router());
		}
		
	}

}