package com.project.app
{
	import com.demonsters.debugger.MonsterDebugger;
	import com.geleca.as3.mvc.core.GATracker;
	import com.geleca.as3.mvc.core.Router;
	import com.geleca.as3.util.StatsMonitor;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.system.Security;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	[SWF(width="1002", height="780", frameRate="55", backgroundColor="#000000")]
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			MonsterDebugger.initialize(this);
			
			stage.align 		= StageAlign.TOP_LEFT;
			stage.scaleMode 	= StageScaleMode.NO_SCALE;
			
			App.getInstance().startup(this, new AppLoaderView(), new AppView(), new Router(), new GATracker(),config);
		}
		
	}
	
}