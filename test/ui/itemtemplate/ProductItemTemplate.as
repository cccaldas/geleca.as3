package ui.itemtemplate 
{
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.ui.component.data.ItemTemplate;
	import ui.skin.ProductItemTemplateSkin;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProductItemTemplate extends ItemTemplate
	{
		
		public function ProductItemTemplate() 
		{
			super(ProductItemTemplateSkin);
			hitArea = new HitArea(200, 80, .3);
		}
		
	}

}