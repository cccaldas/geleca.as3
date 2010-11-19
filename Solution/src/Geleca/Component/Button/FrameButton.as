package Geleca.Component.Button 
{
	import flash.display.MovieClip;
	
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
		
	}

}