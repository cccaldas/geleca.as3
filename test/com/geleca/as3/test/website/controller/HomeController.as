package com.geleca.as3.test.website.controller
{
	import com.geleca.as3.collection.List;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.FileLoaderItem;
	import com.geleca.as3.mvc.core.ActionResult;
	import com.geleca.as3.mvc.core.Controller;
	import com.geleca.as3.mvc.core.FileEntityLoaderItem;
	import com.geleca.as3.util.VectorUtil;
	import com.geleca.as3.test.website.view.HomeView;

	public class HomeController extends Controller
	{
		public function HomeController()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
		}
		
		override public function load():void
		{
			//loader.addLoaderItem(new FileLoaderItem("data.xml", app.config.getAppKey("path-xml") + "data.xml"));
			
			super.load();
		}
		
		override protected function load_complete():void
		{
			super.load_complete();
			
			//GLog.log(loader.getItem("data.xml"));
		}
		
		override protected function setup():void
		{
			// TODO Auto Generated method stub
			super.setup();
		}
		
		public function index():ActionResult
		{
			/*var medias:Vector.<MediaVO> = new MediasModel(this.app, XML(loader.getItem("data.xml"))).getMedias();
			
			viewData["medias"] = medias;
			
			var loadingItems:Array = [];
			
			for (var i:int = 0; i < medias.length; i++) 
			{
				//GLog.log(medias[i].thumb.src);
				loadingItems.push(new FileEntityLoaderItem(medias[i].thumb));
			}*/
			
			
			//GLog.log(medias);
			
			return new ActionResult(HomeView, null, null);
		}
	}
}