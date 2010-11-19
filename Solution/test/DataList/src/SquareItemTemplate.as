package
{
	import Simbionte.View.Component.Data.ItemTemplate;
	
	public class SquareItemTemplate extends ItemTemplate
	{
		
		public function SquareItemTemplate() 
		{
			
		}
		
		protected function get asset():AssetTemplate { return AssetTemplate(_asset); }
		
		override protected function bind():void 
		{
			asset.txt.text = itemIndex.toString();
			
			super.bind();
		}
		
	}

}