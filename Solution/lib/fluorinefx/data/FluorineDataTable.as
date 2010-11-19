package fluorinefx.data 
{
	import Geleca.Data.DataTable;
	
	public class FluorineDataTable
	{
		private var _result          :Object;
		private var _columnNames     :Array;
		
		public function FluorineDataTable(result:Object = null ) 
		{
			_result = result;
		}
		
		public function getColumnValue(colName:String, rowIndex:uint):String 
		{
			var _return:String = "";
			try 
			{
				_return = initialData[rowIndex][getColumnIndex(colName)];
			}
			catch (err:Error)
			{
				_return = null;
			}
			
			return _return;
			//return initialData[rowIndex][getColumnIndex(colName)];
		}
		
		private function getColumnIndex(colName:String):int
		{
			var index:int = -1;
			
			for (var i:int = 0; i < columnNames.length; i++) 
			{
				if (columnNames[i] == colName) return i;
			}
			
			return index;
		}
		
		public function get initialData():Array { return result.serverInfo.initialData; }
		
		public function get columnNames():Array { return result.serverInfo.columnNames; }
		
		public function get result():Object { return _result; }
		
		public function set result(value:Object):void 
		{
			_result = value;
		}
		
		public function generateDataTable(primaryKey:String):DataTable
		{
			var dt:DataTable = new DataTable(Vector.<String>(columnNames), primaryKey);
			
			var length	:uint = initialData.length;
			
			for (var i:int = 0; i < length; i++) 
			{
				dt.insert(Vector.<String>(initialData[i]));
			}
			
			return dt;			
		}
		
	}

}