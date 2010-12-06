package Geleca.Layout 
{
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class LayoutSettings
	{		
		public static const NONE			:String = "NONE";
		
		public static const LEFT			:String = "LEFT";
		public static const RIGHT			:String = "RIGHT";
		public static const CENTER			:String = "CENTER";
		
		public static const TOP				:String = "TOP";
		public static const BOTTOM			:String = "BOTTOM";
		public static const MIDDLE			:String = "MIDDLE";
		
		private var _width					:Object;
		private var _height					:Object;
		
		private var _horizontalAlignment	:String;
		private var _verticalAlignment		:String;
		
		private var _margin					:Object;
		
		private var _minX					:Object;
		private var _maxX					:Object;
		private var _minY					:Object;
		private var _maxY					:Object;
		
		public function LayoutSettings(width:Object, height:Object, horizontalAlignment:String, verticalAlignment:String, margin:Object = null, minX:Object = null, maxX:Object = null, minY:Object = null, maxY:Object = null)
		{			
			_width					= width;
			_height					= height;
			_horizontalAlignment	= horizontalAlignment;
			_verticalAlignment		= verticalAlignment;
			_margin					= margin;
			_minX					= minX;
			_minY					= minY;
			_maxX					= maxX;
			_maxY					= maxY;
		}
		
		public function get width()					:Object			{ return _width; }
		public function get height()				:Object			{ return _height; }
		public function get horizontalAlignment()	:String			{ return _horizontalAlignment; }
		public function get verticalAlignment()		:String			{ return _verticalAlignment; }
		public function get margin()				:Object 		{ return _margin; }
		public function get minX()					:Object 		{ return _minX; }
		public function get maxX()					:Object 		{ return _maxX; }
		public function get minY()					:Object 		{ return _minY; }
		public function get maxY()					:Object 		{ return _maxY; }
	}

}