package com.geleca.as3.layout 
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
		
		public var width					:Object;
		public var height					:Object;
		
		public var horizontalAlignment		:String;
		public var verticalAlignment		:String;
		
		public var margin					:Object;
		
		public var minX					:Object;
		public var maxX					:Object;
		public var minY					:Object;
		public var maxY					:Object;
		
		public function LayoutSettings(width:Object, height:Object, horizontalAlignment:String, verticalAlignment:String, margin:Object = null, minX:Object = null, maxX:Object = null, minY:Object = null, maxY:Object = null)
		{			
			this.width					= width;
			this.height					= height;
			this.horizontalAlignment	= horizontalAlignment;
			this.verticalAlignment		= verticalAlignment;
			this.margin					= margin;
			this.minX					= minX;
			this.minY					= minY;
			this.maxX					= maxX;
			this.maxY					= maxY;
		}
	}

}