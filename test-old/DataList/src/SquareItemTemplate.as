package
{
	import flash.text.TextFieldAutoSize;
	import Geleca.Component.Data.ItemTemplate;
	import Geleca.Display.HitArea;
	
	public class SquareItemTemplate extends ItemTemplate
	{
		
		public function SquareItemTemplate() 
		{
			
		}
		
		protected function get asset():AssetTemplate { return AssetTemplate(_asset); }
		
		override protected function setup():void 
		{
			super.setup();
			
			hitArea = new HitArea(150, 50, .5);
			
			asset.txt.autoSize = TextFieldAutoSize.LEFT;
		}
		
		override protected function bind():void 
		{
			asset.txt.text = "item - " + itemIndex.toString();
			asset.txt.width = asset.txt.textWidth;
			asset.txt.height = asset.txt.textHeight;
			
			super.bind();
		}
		
	}

}