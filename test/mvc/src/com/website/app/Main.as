package com.website.app 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
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
			
			new App(this).initializeApp();
		}
		
	}

}