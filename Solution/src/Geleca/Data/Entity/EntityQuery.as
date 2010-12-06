package Geleca.Data.Entity 
{
	import Geleca.Data.DataQuery;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class EntityQuery
	{
		public static const EQUAL					:String = DataQuery.EQUAL;
		public static const NOT_EQUAL				:String = DataQuery.NOT_EQUAL;
		public static const GREATER_THAN			:String = DataQuery.GREATER_THAN;
		public static const GREATER_OR_EQUAL_THAN	:String = DataQuery.GREATER_OR_EQUAL_THAN;
		public static const LESS_THAN				:String = DataQuery.LESS_THAN;
		public static const LESS_OR_EQUAL_THAN		:String = DataQuery.LESS_OR_EQUAL_THAN;
		public static const LIKE					:String = DataQuery.LIKE;
		
		public static const ORDER_ASC				:String = DataQuery.ORDER_ASC;
		public static const ORDER_DESC				:String = DataQuery.ORDER_DESC;
		public static const ORDER_RANDOM			:String = DataQuery.ORDER_RANDOM;
		
		private var _entities						:Array = [];
		private var _entitySet						:EntitySet;
		
		private var _query							:DataQuery;
		
		private var _updateEntities					:Boolean = false;
		
		public function EntityQuery(entitySet:EntitySet) 
		{
			_entitySet 	= entitySet;
			_query 		= new DataQuery(_entitySet.settings.dataTable);
		}
		
		public function get entities():Array
		{
			if (!_query.result)
				return [];
				
			checkUpdate();
			
			return _entities; 
		}
		
		public function get length():uint { return entities.length; }
		
		public function first():Object
		{
			return length != 0 ? entities[0] : null;
		}
		
		public function last():Object
		{
			return length != 0 ? entities[entities.length - 1] : null;
		}
		
		public function where(property:*, compare:String, value:*):EntityQuery
		{
			_query.where(propToColumn(property), compare, value).result;
			
			_updateEntities = true;
			
			return this;
		}
		
		public function orderBy(order:String, column:*=null):EntityQuery
		{
			_query.orderBy(order, column);
			
			_updateEntities = true;
			
			return this;
		}
		
		private function propToColumn(prop:*):String
		{
			return String(_entitySet.settings.map[prop]);
		}
		
		/**Verifica se há atualizações na consulta para gerar as novas entidades.*/
		private function checkUpdate():void 
		{
			if (!_updateEntities)
				return;
			
			_entities = [];
			
			var entity	:Object;
			var length	:uint = _query.result.length;
			var PKIndex	:Number = _entitySet.settings.dataTable.getColumnIndex(_entitySet.settings.dataTable.primaryKey);
			
			for (var i:int = 0; i < length; i++) 
			{
				entity = _entitySet.byPK(_query.result[i][PKIndex]);
				_entities.push(entity);
			}
		}
	}

}