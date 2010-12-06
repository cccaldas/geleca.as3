package Geleca.Data
{
	import flash.utils.Dictionary;
	import Geleca.Core.IDestroyable;
	import Geleca.Data.DataTable;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class DataSet implements IDestroyable
	{
		private var _tables							:Dictionary = new Dictionary();
		
		public function DataSet() 
		{
			
		}
		
		public function createTable(name:String, columns:Array, primaryKey:String=null):DataTable
		{
			var table:DataTable = new DataTable(columns, primaryKey);
			
			_tables[name] = table;
			
			return table;
		}
		
		public function getTable(name:String):DataTable
		{
			return DataTable(_tables[name]);
		}
		
		public function deleteTable(name:String):void 
		{
			getTable(name).destroy();
			_tables[name] = null;
		}
		
		public function destroy():void 
		{
			for (var key:String in _tables) 
			{
				delete _tables[key];
			}
			
			_tables = null;
		}
		
	}

}