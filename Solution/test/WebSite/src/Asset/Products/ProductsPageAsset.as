package Asset.Products 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author 
	 */
	public class ProductsPageAsset extends Sprite
	{
		public var txt_title				:TextField = new TextField();
		
		public function ProductsPageAsset() 
		{
			addChild(txt_title);
			
			txt_title.text = "Products";
		}
		
	}

}