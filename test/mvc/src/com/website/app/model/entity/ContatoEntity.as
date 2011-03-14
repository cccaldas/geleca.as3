package com.website.app.model.entity 
{
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ContatoEntity
	{
		public var nome			:String;
		public var email		:String;
		public var telefone		:String;
		public var msg			:String;
		
		public function ContatoEntity() 
		{
			var loader:Loader = new Loader();
			loader.load(new URLRequest("movie.swf"), new LoaderContext(false, ApplicationDomain.currentDomain));
		}
		
	}

}