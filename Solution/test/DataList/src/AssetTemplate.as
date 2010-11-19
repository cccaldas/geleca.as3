package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author 
	 */
	public class AssetTemplate extends Sprite
	{
		public var txt			:TextField = new TextField();
		
		public function AssetTemplate() 
		{
			graphics.beginFill(0xcccccc);
			graphics.drawRect(0, 0, 200, 50);
			graphics.endFill();
			
			addChild(txt);
			txt.x = txt.y = 20;
		}
		
	}

}