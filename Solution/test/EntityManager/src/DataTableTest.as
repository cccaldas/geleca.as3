package  
{
	import Simbionte.Data.DataQuery;
	import Simbionte.Data.DataTable;
	import Simbionte.Data.XmlDataAdapter;
	/**
	 * ...
	 * @author 
	 */
	public class DataTableTest
	{
		[Embed(source = "../data/data.xml",  mimeType="application/octet-stream")]
		private var _data		:Class;
		private var data		:XML;
		
		protected var table		:DataTable;
		
		public function DataTableTest() 
		{
			data = XML(new _data());
			
			table = new DataTable(["id", "name", "phone", "countryID"], "id");
		}
		
		public function run():void 
		{
			table.appendData(new XmlDataAdapter(data.client.client, XmlDataAdapter.NAVIGATION_ATTRIBUTES));
			
			var query:DataQuery = new DataQuery(table);
			query.where("countryID", DataQuery.GREATER_OR_EQUAL_THAN, 2).orderBy(DataQuery.ORDER_ASC, "countryID");
			
			reportRows(query.result);
		}
		
		private function reportRows(rows:Vector.<Vector.<String>>):void 
		{
			trace(this, "===========================");
			trace(this, "Report Table");
			
			for (var i:int = 0; i < rows.length; i++) 
			{
				trace(this, "Row " + i.toString(), rows[i]);
			}
			
			trace(this, "===========================");
		}
	}

}