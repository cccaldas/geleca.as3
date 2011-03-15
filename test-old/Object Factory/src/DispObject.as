package  
{
	import flash.display.Sprite;
	import Geleca.Core.IDisposable;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class DispObject implements IDisposable
	{
		public var sprite		:Sprite = new Sprite();
		
		public function DispObject() 
		{
			
		}
		
		/* INTERFACE Geleca.Core.IDisposable */
		
		public function dispose():void
		{
			sprite = null;
		}
		
		/* INTERFACE Geleca.Core.IDisposable */
		
		public function create():void
		{
			
		}
		
	}

}