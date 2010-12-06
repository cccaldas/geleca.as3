package Test.View 
{
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import Geleca.UI.CustomContextMenu;
	import Geleca.View.Loading.LoaderInfoLoaderItem;
	import Geleca.View.Loading.ViewLoaderItem;
	import Geleca.View.View;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class TestViewLoader extends View
	{
		public var testView					:TestView;
		
		public function TestViewLoader() 
		{
			stage.align 	= StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			new CustomContextMenu(this);
			
			this.initializeView();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			testView = addView(new TestView()) as TestView;
			
			addLoaderItem(new LoaderInfoLoaderItem(loaderInfo));
			addLoaderItem(new ViewLoaderItem("testView", testView));
		}
		
	}

}