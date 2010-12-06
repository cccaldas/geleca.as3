package Geleca.Data 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public dynamic class DataRow extends Object
	{
		
		public function DataRow() 
		{
			
		}
		
		public function getValue(column:String):String 
		{
			return this[column];
		}
		
	}

}