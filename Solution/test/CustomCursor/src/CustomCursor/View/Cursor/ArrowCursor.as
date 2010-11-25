package CustomCursor.View.Cursor 
{
	import flash.display.Sprite;
	import flash.ui.Mouse;
	import Geleca.Component.Cursor.CustomCursor;
	import Geleca.Effects.Transition.FadeTransition;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ArrowCursor extends CustomCursor
	{
		public static const NAME				:String = "ArrowCursor";
		
		public function ArrowCursor(asset:Sprite) 
		{
			super(asset);
		}
		
		override protected function setVariables():void 
		{
			super.setVariables();
			
			_asset.visible = false;
			_asset.alpha = 0;
		}
		
		override public function move(x:Number, y:Number):void 
		{
			super.move(x, y);
			
			Mouse.hide();
		}
		
		override public function show():void 
		{
			super.show();
			
			_asset.visible = true;
			
			FadeTransition.fadeIn(_asset);
			
			Mouse.hide();
		}
		
		override public function hide():void 
		{
			super.hide();
			
			FadeTransition.fadeOut(_asset);
			
			Mouse.show();
		}
		
	}

}