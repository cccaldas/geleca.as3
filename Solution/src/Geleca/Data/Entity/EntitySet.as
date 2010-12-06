package Geleca.Data.Entity 
{
	import flash.utils.Dictionary;
	import Geleca.Data.DataRow;
	import Geleca.Data.DataTable;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	
	//TODO: Implementar Relationships: Update
	
	public class EntitySet
	{	
		private var _relationships	:Vector.<EntitySetRelationship> = new Vector.<EntitySetRelationship>();
		private var _settings		:EntitySetSettings;
		
		public function EntitySet(settings:EntitySetSettings) 
		{
			_settings = settings;
		}
		
		public function get settings():EntitySetSettings { return _settings; }
		
		public function byPK(PK:*):Object
		{
			var data	:DataRow 	= _settings.dataTable.selectByPrimaryKey(String(PK));
			var entity	:Object 	= new _settings.entityClass();
			
			if (data)
			{
				for (var prop:String in _settings.map) 
				{
					entity[_settings.map[prop]] = data[prop];
				}
				
				if (hasRelationship())
				{
					var length:uint = _relationships.length;
					for (var i:int = 0; i < length; i++) 
					{
						relationship_read(entity, _relationships[i]);
					}
				}
			}
			else 
				entity = null;
			
			return entity;
		}
		
		public function all():Array
		{
			var entities	:Array = [];
			var entity		:Object;
			var length		:uint = this.length;
			
			for (var i:int = 0; i < length; i++) 
			{
				entity = byPK(_settings.dataTable.getRowAt(i)[_settings.dataTable.primaryKey]);
				entities.push(entity);
			}
			
			return entities;
		}
		
		public function where(property:*, compare:String, value:*):EntityQuery
		{
			return new EntityQuery(this).where(property, compare,value);
		}
		
		public function get length():uint { return _settings.dataTable.length; }
		
		public function insert(entity:Object):void 
		{
			entity[getPrimaryKeyProperty()] = _settings.dataTable.insert(entityToDataTable(entity));
			
			if (hasRelationship())
			{
				var length:uint = _relationships.length;
				for (var i:int = 0; i < length; i++) 
				{
					relationship_insert(entity, _relationships[i]);
				}
			}
		}
		
		public function remove(entity:Object):void 
		{
			var key:* = entity[getPrimaryKeyProperty()];
			
			//Verifica se o objeto existe no DataTable
			if (_settings.dataTable.selectByPrimaryKey(String(key)) != null)
			{
				_settings.dataTable.remove(String(key));
				
				if (hasRelationship())
				{
					var length:uint = _relationships.length;
					for (var i:int = 0; i < length; i++) 
					{
						relationship_remove(entity, _relationships[i]);
					}
				}
			}
		}
		
		public function removeAll():void 
		{
			var entities	:Array = all();
			var length		:uint = entities.length;
			for (var i:int = 0; i < length; i++) 
			{
				remove(entities[i]);
			}
		}
		
		public function update(entity:Object):void 
		{
			_settings.dataTable.update(entityToDataTable(entity));
		}
		
		public function addRelationship(rel:EntitySetRelationship):void 
		{
			_relationships.push(rel);
		}
		
		public function hasRelationship():Boolean
		{
			return _relationships.length > 0;
		}
		
		//Relationship para Leitura
		private function relationship_read(entity:Object, rel:EntitySetRelationship):void 
		{			
			switch (rel.type) 
			{
				case EntitySetRelationship.ONE_TO_ONE:
					entity[rel.propNavigator] = rel.toEntitySet.where(rel.propTo, EntityQuery.EQUAL, entity[rel.propFrom]).first();
				break;
				
				case EntitySetRelationship.ONE_TO_MANY:
					entity[rel.propNavigator] = rel.toEntitySet.where(rel.propTo, EntityQuery.EQUAL, entity[rel.propFrom]).entities;
				break;
			}
		}
		
		//Relationship para deleção
		private function relationship_remove(entity:Object, rel:EntitySetRelationship):void 
		{
			if (entity[rel.propNavigator] != null && rel.deleteCascate)
			{
				switch (rel.type) 
				{
					case EntitySetRelationship.ONE_TO_ONE:
						rel.toEntitySet.remove(entity[rel.propNavigator]);
					break;
					
					case EntitySetRelationship.ONE_TO_MANY:
						var length:uint = entity[rel.propNavigator].length;
						for (var i:int = 0; i < length; i++) 
						{
							rel.toEntitySet.remove(entity[rel.propNavigator][i]);
						}
					break;
				}
			}
		}
		
		//Relationship para inserção
		private function relationship_insert(entity:Object, rel:EntitySetRelationship):void 
		{
			if (entity[rel.propNavigator] != null)
			{
				switch (rel.type) 
				{
					case EntitySetRelationship.ONE_TO_MANY:
						var length:uint = entity[rel.propNavigator].length;
						for (var i:int = 0; i < length; i++) 
						{
							entity[rel.propNavigator][i][rel.propTo] = entity[rel.propFrom];
							
							rel.toEntitySet.insert(entity[rel.propNavigator][i]);
						}
					break;
				}
			}
		}
		
		private function getPrimaryKeyProperty():String
		{
			return _settings.map[_settings.dataTable.primaryKey];
		}
		
		private function entityToDataTable(entity:Object):Array
		{
			var row		:Array 	= [];
			var columns	:Array 	= _settings.dataTable.columns;
			var length	:uint 	= columns.length;
			
			for (var i:int = 0; i < length; i++) 
			{
				row.push(entity[_settings.map[columns[i]]]);
			}
			
			return row;
		}
		
	}

}