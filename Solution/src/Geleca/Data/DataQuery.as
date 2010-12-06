package Geleca.Data 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class DataQuery
	{
		public static const EQUAL					:String = "EQUAL";
		public static const NOT_EQUAL				:String = "NOT_EQUAL";
		public static const GREATER_THAN			:String = "GREATER_THAN";
		public static const GREATER_OR_EQUAL_THAN	:String = "GREATER_OR_EQUAL_THAN";
		public static const LESS_THAN				:String = "LESS_THAN";
		public static const LESS_OR_EQUAL_THAN		:String = "LESS_OR_EQUAL_THAN";
		public static const LIKE					:String = "LIKE";
		
		public static const ORDER_ASC				:String = "ORDER_ASC";
		public static const ORDER_DESC				:String = "ORDER_DESC";
		public static const ORDER_RANDOM			:String = "ORDER_RANDOM";
		
		protected var table							:DataTable;
		protected var data							:Vector.<Vector.<String>>;
		
		public function DataQuery(table:DataTable) 
		{
			this.table = table;
		}
		
		public function where(column:*, compare:String, value:*):DataQuery
		{
			if (!data)
				data = table.getAll();
			
			var tmpData		:Vector.<Vector.<String>> = new Vector.<Vector.<String>>();
			var row			:Vector.<String>;
			var length		:uint = data.length
			
			for (var i:int = 0; i < length; i++) 
			{
				row = data[i];
				if (columnCompare(row[getColumnIndex(column)], compare, value))
					tmpData.push(row);
			}
			
			this.data = tmpData;
			
			return this;
		}
		
		private function getColumnIndex(name:String):Number
		{
			return table.getColumnIndex(name);
		}
		
		public function orderBy(order:String, column:*=null):DataQuery
		{
			if (!data)
				data = table.getAll();
				
			function orderBy_asc(a:Vector.<String>, b:Vector.<String>):Number
			{
				if(a[getColumnIndex(column)] <= b[getColumnIndex(column)])
					return -1;
				else 
					return 1;
			}
			
			function orderBy_desc(a:Vector.<String>, b:Vector.<String>):Number
			{
				if(a[getColumnIndex(column)] <= b[getColumnIndex(column)])
					return 1;
				else 
					return -1;
			}
			
			function orderBy_random(a:Vector.<String>, b:Vector.<String>):Number
			{
				return Math.round(Math.random()*2)-1;
			}
				
			switch (order) 
			{
				case ORDER_ASC:
					data.sort(orderBy_asc);
				break;
				
				case ORDER_DESC:
					data.sort(orderBy_desc);					
				break;
				
				case ORDER_RANDOM:
					data.sort(orderBy_random);
				break;
			}
			
			return this;
		}
		
		public function get result():Vector.<Vector.<String>> { return this.data; }
		
		private function columnCompare(value1:*, compare:String, value2:*):Boolean
		{
			switch (compare) 
			{
				case EQUAL:
					return value1 == value2;
				break;
				
				case NOT_EQUAL:
					return value1 != value2;
				break;
				
				case GREATER_THAN:
					return value1 > value2;
				break;
				
				case GREATER_OR_EQUAL_THAN:
					return value1 >= value2;
				break;
				
				case LESS_THAN:
					return value1 < value2;
				break;
				
				case LESS_OR_EQUAL_THAN:
					return value1 <= value2;
				break;
				
				case LIKE:
					return String(value1).indexOf(String(value2)) != -1;
				break;
			}
			
			return false;
		}
	}

}