package
{
	import Geleca.Component.Data.ItemTemplate;
	
	public class SquareItemTemplate extends ItemTemplate
	{
		
		public function SquareItemTemplate() 
		{
			
		}
		
		protected function get asset():AssetTemplate { return AssetTemplate(_asset); }
		
		override protected function bind():void 
		{
			asset.txt.text = "item - " + itemIndex.toString();
			
			trace(this);
			
			super.bind();
		}
		
	}

}