package View 
{
	import Geleca.Component.Button.Button;
	import Geleca.View.View;
	/**
	 * ...
	 * @author 
	 */
	public class MainView extends View
	{
		private var asset				:ViewAsset = new ViewAsset();
		
		public var btn1					:Button;
		public var btn2					:Button;
		public var btn3					:Button;
		
		public function MainView() 
		{
			
		}
		
		override protected function setAssets():void 
		{
			super.setAssets();
			
			addChild(asset);
		}
		
		override protected function setComponents():void 
		{
			super.setComponents();
			
			btn1 = addComponent(new Button(asset.btn_1)) as Button;
			btn2 = addComponent(new Button(asset.btn_2)) as Button;
			btn3 = addComponent(new Button(asset.btn_3)) as Button;
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			asset = null;
			
			btn1 = null;
			btn2 = null;
			btn3 = null;
		}
		
	}

}