package Asset 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author 
	 */
	public class ShellAsset extends Sprite
	{
		public var btn_contact		:PageButtonAsset = new PageButtonAsset();
		public var btn_products		:PageButtonAsset = new PageButtonAsset();
		
		public var ctn_pages		:Sprite = new Sprite();
		
		public function ShellAsset() 
		{
			addChild(ctn_pages);
			
			addChild(btn_contact);
			addChild(btn_products);
			
			btn_contact.x = btn_products.x = 400;
			btn_products.y = 40;
			
			btn_contact.txt_label.text = "Contact";
			btn_products.txt_label.text = "Products";
		}
		
	}

}