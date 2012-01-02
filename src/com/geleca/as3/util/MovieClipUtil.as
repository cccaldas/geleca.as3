package com.geleca.as3.util
{
	import flash.display.MovieClip;
	import flash.display.FrameLabel;

	public class MovieClipUtil extends Object
	{
	
		public function MovieClipUtil()
		{
			super();
		}
		
		public static function getFrameByLabel(mc:MovieClip, label:String):int
		{
			for each (var flabel:FrameLabel in mc.currentLabels)
			{
				if(flabel.name == label)
					return flabel.frame;
			}
			
			return -1;
		}
	
	}

}