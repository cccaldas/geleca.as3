package com.geleca.as3.mvc.core 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class URLParameters
	{
		private var _url			:String;
		private var _match			:String;
		private var _pathNames		:Array;
		private var _matchPathNames	:Array;
		
		public function URLParameters(url:String, match:String) 
		{
			_url 			= url;
			_match 			= match;
			_pathNames		= url.split("/");
			_matchPathNames = match.split("/");
		}
		
		public function get url():String { return _url; }
		
		public function get(name:String):String
		{
			var item:String;
			
			for (var i:int = 0; i < _matchPathNames.length; i++) 
			{
				item = _matchPathNames[i];
				if (item == "{" + name + "}")
					return _pathNames[i];
			}
			
			return null;
		}
		
	}

}