package com.geleca.as3.mvc.core 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class RouteAction
	{
		private var _route			:Route;
		private var _url			:String;
		private var _parameters		:URLParameters;
		
		public var post				:*;
		
		public function RouteAction(route:Route, url:String) 
		{
			_route 			= route;
			_url 			= url;
			_parameters 	= new URLParameters(url, route.url);
		}
		
		public function get route()			:Route 			{ return _route; }
		public function get url()			:String 		{ return _url; }
		public function get parameters()	:URLParameters 	{ return _parameters; }
		
	}

}