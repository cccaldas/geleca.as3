package Geleca.Data 
{
	import flash.display.LineScaleMode;
	import flash.system.System;
	import flash.utils.Dictionary;
	import Geleca.Core.IDestroyable;
	import Geleca.Exception.DataTableException;
	import Geleca.Util.VectorUtil;
	
	public class DataTable implements IDestroyable
	{
		private var _destroyed						:Boolean = false;
		
		private var _columns		:Array = [];
		private var _data			:Dictionary 		= new Dictionary();
		private var _index			:Vector.<String> 	= new Vector.<String>(); //índices de KEY
		private var _primaryKey		:String 			= null;
		private const PRIMARY_KEY	:String				= "";
		
		public function DataTable(columns:Array, primaryKey:String = null)
		{
			_primaryKey = primaryKey;
			
			if (!primaryKey)
				columns.push(PRIMARY_KEY);
			
			_columns		= columns;
			_columns.fixed 	= true;
		}
		
		/**Retorna o PrimaryKey gerado.*/
		public function insert(data:Array):String 
		{
			var key:String;
			
			if (_primaryKey)
			{
				key = data[getColumnIndex(_primaryKey)];
				
				if (key == null || key == "" || selectByPrimaryKey(key) != null || key == "0")
				{
					data[getColumnIndex(_primaryKey)] = generateUniquePrimaryKey();
					key = data[getColumnIndex(_primaryKey)];
				}
			}
			else
			{
				key = generateUniquePrimaryKey();
				data.push(key);
			}
				
			data.fixed = true;
			
			if (data.length == _columns.length)
			{
				_data[key] = Vector.<String>(data);
				_index.push(key);
			}
			else
				throw DataTableException.INVALID_COLUMNS;
				
			return key;
		}
		
		public function remove(PKValue:String):void 
		{
			_index.splice(_index.indexOf(PKValue), 1);
			
			_data[PKValue] = null;
			delete _data[PKValue];
		}
		
		public function update(data:Array):void 
		{
			var key:String = String(data[getColumnIndex(_primaryKey)]);
			
			_data[key] = null;
			delete _data[key];
			_data[key] = Vector.<String>(data);
		}
		
		public function getItemAt(index:uint):Vector.<String> 
		{
			return _data[_index[index]];
		}
		
		public function getRowAt(index:uint):DataRow
		{
			return getRow(_data[_index[index]]);
		}
		
		private function getRow(data:Vector.<String>):DataRow
		{
			var row		:DataRow;
			var length	:uint 				= _columns.length;
			
			if(data)
			{
				row = new DataRow();
				for (var i:int = 0; i < length; i++) 
				{
					row[_columns[i]] = data[i];
				}
			}
			
			return row;
		}
		
		public function appendData(adapter:DataAdapter):void 
		{
			var data	:Vector.<Vector.<String>> = adapter.getData();
			var length	:uint = data.length;
			
			for (var i:int = 0; i < length; i++) 
			{
				insert(VectorUtil.vectorToArray(data[i]));
			}
		}
		
		public function getColumnIndex(name:String):Number 
		{
			var length	:uint = _columns.length;
			for (var i:int = 0; i < length; i++) 
			{
				if (_columns[i] == name) return i;
			}
			return -1;
		}
		
		public function get columns()		:Array 		{ return _columns; }
		public function get length()		:uint 		{ return _index.length; }
		public function get primaryKey()	:String 	{ return _primaryKey; }
		
		public function selectByPrimaryKey(PKValue:String):DataRow
		{
			return getRow(_data[PKValue]);
		}
		
		public function selectByColumnValue(columnName:String, value:String):Vector.<DataRow>
		{
			var data		:Vector.<String>;
			var columnIndex	:Number = getColumnIndex(columnName);
			var rows		:Vector.<DataRow> = new Vector.<DataRow>();
			
			for (var i:int = 0; i < length; i++) 
			{
				data = getItemAt(i);
				if (data[columnIndex] == value) 
					rows.push(getRowAt(i));
			}
			
			return rows;			
		}
		
		private function generateUniquePrimaryKey():String
		{
			var PK:String = generateUniquePrimaryKey_randomize();
			
			while (selectByPrimaryKey(PK) != null) 
			{
				PK = generateUniquePrimaryKey_randomize();
			}
			
			return PK;
		}
		
		private function generateUniquePrimaryKey_randomize():String
		{
			//return String(Math.round(Math.random() * new Date().getTime()));
			return String(_index.length + 1);
		}
		
		public function getAll():Vector.<Vector.<String>>
		{
			var data:Vector.<Vector.<String>> = new Vector.<Vector.<String>>();
			
			for (var i:int = 0; i < length; i++) 
			{
				data.push(getItemAt(i));
			}
			
			return data;
		}
		
		public function removeAll():void 
		{
			_index = new Vector.<String>();
			
			for (var key:String in _data) 
			{
				delete _data[key];
			}
		}
		
		public function destroy():void
		{
			removeAll();
			
			_columns 	= null;
			_data 		= null;
			_index 		= null;
			
			_destroyed = true;
			
			System.gc();
		}
		
	}

}