﻿package com.geleca.as3.util
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class HtmlTags 
	{
		public static const BR       :String = "<br>";
		public static const BR_BR    :String = BR + BR;
		
		public function HtmlTags() 
		{
			
		}
		
		public static function bold(value:String):String 
		{
			return String("<b>" + value + "</b>");
		}
		
	}
	
}