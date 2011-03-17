package com.geleca.as3.mvc.core 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Route
	{
		private var _name			:String;
		private var _url			:String;
		private var _controller		:Class;
		private var _action			:String;
		private var _isDefault		:Boolean;
		
		public function Route(name:String, url:String, controller:Class, action:String = "index", isDefault:Boolean=false)
		{
			_name			= name;
			_url 			= url;
			_controller 	= controller;
			_action 		= action;
			_isDefault 		= isDefault;
		}
		
		public function get name()			:String 	{ return _name; }
		public function get url()			:String 	{ return _url; }
		public function get controller()	:Class 		{ return _controller; }
		public function get action()		:String 	{ return _action; }
		public function get isDefault()		:Boolean 	{ return _isDefault; }
		
		public function match(url:String):Boolean
		{
			var url_path 	:Array = url.split("/");
			//TODO: mudar a classe URLParameters para tipo URLHeader para que possa minerar a url e chegar parametros e limpar as '/'
			url_path.shift();
			url_path.pop();
			
			var match_path 	:Array = _url.split("/");
			match_path.shift();
			match_path.pop();
			
			//trace(this, "url_path", url_path, url_path.length);
			
			//Tamanhos
			if (url_path.length != match_path.length)
				return false;
				
			//Parametros
			for (var i:int = 0; i < url_path.length; i++) 
			{
				if (!match_isParameter(match_path[i]))
					if (url_path[i] != match_path[i])
						return false;
			}
			
			return true;
		}
		
		private function match_isParameter(value:String):Boolean
		{
			//trace(this, "matchURL_isParameter", value, (value.indexOf("{") != -1 && value.indexOf("}") != -1));
			
			return value.indexOf("{") != -1 && value.indexOf("}") != -1;
		}
		
	}

}