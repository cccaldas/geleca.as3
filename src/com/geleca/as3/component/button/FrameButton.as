package com.geleca.as3.component.button 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	
	public class FrameButton extends Button
	{
		
		public function FrameButton(asset:MovieClip) 
		{
			super(asset);
		}
		
		override protected function rollOver():void 
		{
			MovieClip(_asset).gotoAndPlay("rollOver");
			
			super.rollOver();
		}
		
		override protected function rollOut():void 
		{
			MovieClip(_asset).gotoAndPlay("rollOut");
			
			super.rollOut();
		}
		
		override protected function enable():void 
		{
			MovieClip(_asset).gotoAndPlay("enable");
			
			super.enable();
		}
		
		override protected function disable():void 
		{
			MovieClip(_asset).gotoAndPlay("disable");
			
			super.disable();
		}
		
		override protected function select():void 
		{
			MovieClip(_asset).gotoAndPlay("select");
			
			super.select();
		}
		
		override protected function unselect():void 
		{
			MovieClip(_asset).gotoAndPlay("unselect");
			
			super.unselect();
		}
		
	}

}