package  
{
	import Geleca.Core.ObjectFactory;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Test
	{
		private var length	:uint = 10000;
		private var disp	:DispObject;
		
		public function Test() 
		{
			
		}
		
		public function run():void 
		{
			for (var i:int = 0; i < length; i++) 
			{
				disp = new DispObject();
			}
		}
		
		public function runFactory():void 
		{
			var factory:ObjectFactory = new ObjectFactory();
			
			for (var i:int = 0; i < length; i++) 
			{
				disp = factory.create(DispObject);
				factory.dispose(disp);
			}
			
		}
		
	}

}