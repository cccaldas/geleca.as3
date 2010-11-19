package Geleca.Data.Entity 
{
	import flash.utils.Dictionary;
	
	public class EntityManager
	{
		private var _sets		:Dictionary = new Dictionary();
		
		public function EntityManager() 
		{
			
		}
		
		protected function createSet(name:String, settings:EntitySetSettings):EntitySet
		{
			_sets[name] = new EntitySet(settings);
			
			return getSet(name);
		}
		
		protected function getSet(name:String):EntitySet
		{
			return EntitySet(_sets[name]);
		}
		
	}

}