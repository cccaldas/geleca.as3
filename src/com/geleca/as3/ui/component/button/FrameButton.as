package com.geleca.as3.ui.component.button 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	
	public class FrameButton extends Button
	{
		
		public function FrameButton(skin:Class) 
		{
			super(skin);
		}
		
		override protected function rollOver():void 
		{
			MovieClip(skin).gotoAndPlay("rollOver");
			
			super.rollOver();
		}
		
		override protected function rollOut():void 
		{
			MovieClip(skin).gotoAndPlay("rollOut");
			
			super.rollOut();
		}
		
		override protected function enable():void 
		{
			MovieClip(skin).gotoAndPlay("enable");
			
			super.enable();
		}
		
		override protected function disable():void 
		{
			MovieClip(skin).gotoAndPlay("disable");
			
			super.disable();
		}
		
		override protected function select():void 
		{
			MovieClip(skin).gotoAndPlay("select");
			
			super.select();
		}
		
		override protected function unselect():void 
		{
			MovieClip(skin).gotoAndPlay("unselect");
			
			super.unselect();
		}
		
	}

}