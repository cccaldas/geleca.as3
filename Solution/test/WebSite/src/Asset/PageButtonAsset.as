package Asset 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author 
	 */
	public class PageButtonAsset extends Sprite
	{
		public var txt_label				:TextField = new TextField();
		
		public function PageButtonAsset() 
		{
			graphics.beginFill(0xcccccc);
			graphics.drawRect(0, 0, 100, 30);
			graphics.endFill();
			
			addChild(txt_label);
			txt_label.x = txt_label.y = 5;
		}
		
	}

}