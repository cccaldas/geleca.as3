package ui 
{
	import com.geleca.as3.ui.component.Component;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class UIComponentsTest extends Sprite 
	{
		
		public function UIComponentsTest() 
		{
			var comp:Component = new Component(Sprite);
			addChild(comp);
			comp.initializeComponent();
		}
		
	}

}