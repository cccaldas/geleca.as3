package Geleca.Component.Cursor
{
	import flash.display.Sprite;
	import Geleca.Util.DepthUtil;
	import Geleca.Component.Component;
	
	public class CustomCursor extends Component
	{		
		public function CustomCursor(asset:Sprite) 
		{
			super(asset);
		}
		
		override protected function setVariables():void 
		{
			enabled = false;
			
			super.setVariables();
		}
		
		override public function move(x:Number, y:Number):void 
		{
			DepthUtil.toFront(_asset);
			
			super.move(x, y);
		}
		
		public function show():void 
		{
			
		}
		
		public function hide():void 
		{
			
		}
		
	}

}