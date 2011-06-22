package com.geleca.as3.mvc.core
{
	import com.geleca.as3.gml.GML;
	import com.geleca.as3.gml.GMLParse;
	import com.geleca.as3.loading.FileLoaderItem;

	public class GMLView extends View
	{
		private var _gml			:GML;
		private var _gmlURL			:String;
		
		public function GMLView(gmlURL:String="view.gml")
		{
			_gmlURL = gmlURL;
		}
		
		override public function load():void
		{
			loader.addLoaderItem(new FileLoaderItem("gml", _gmlURL));
			
			// TODO Auto Generated method stub
			super.load();
		}
		
		override protected function setup():void
		{
			// TODO Auto Generated method stub
			super.setup();
			
			_gml = new GML(XML(loader.getItem("gml")));
			
			new GMLParse(this, _gml);
		}
		
	}
}