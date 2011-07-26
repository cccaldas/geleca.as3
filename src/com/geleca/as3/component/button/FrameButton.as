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
			MovieClip(asset).gotoAndPlay("rollOver");
			
			super.rollOver();
		}
		
		override protected function rollOut():void 
		{
			MovieClip(asset).gotoAndPlay("rollOut");
			
			super.rollOut();
		}
		
		override protected function enable():void 
		{
			MovieClip(asset).gotoAndPlay("enable");
			
			super.enable();
		}
		
		override protected function disable():void 
		{
			MovieClip(asset).gotoAndPlay("disable");
			
			super.disable();
		}
		
		override protected function select():void 
		{
			MovieClip(asset).gotoAndPlay("select");
			
			super.select();
		}
		
		override protected function unselect():void 
		{
			MovieClip(asset).gotoAndPlay("unselect");
			
			super.unselect();
		}
		
	}

}