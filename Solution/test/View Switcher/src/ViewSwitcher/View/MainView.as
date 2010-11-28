package ViewSwitcher.View 
{
	import Geleca.Util.FunctionUtil;
	import Geleca.View.Loading.ViewLoaderItem;
	import Geleca.View.View;
	import Geleca.View.ViewSwitcher;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class MainView extends View
	{
		public var switcher			:ViewSwitcher;
		
		public function MainView() 
		{
			this.initializeView();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			switcher = addView(new ViewSwitcher(IndexView, ViewSwitcher.LOAD_HIDE_SHOW)) as ViewSwitcher;
			
			addLoaderItem(new ViewLoaderItem("switcher", switcher));
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			FunctionUtil.functionDelay(swapView_photos);
			
		}
		
		private function swapView_photos():void 
		{
			switcher.swap(PhotosView);
			
			FunctionUtil.functionDelay(swapView_index, 1);
		}
		
		private function swapView_index():void 
		{
			switcher.swap(IndexView);
		}
	}

}