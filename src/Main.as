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
		
			//init code here
		}
	
	}

}