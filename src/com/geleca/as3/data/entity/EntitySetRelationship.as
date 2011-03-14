package com.geleca.as3.data.entity 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class EntitySetRelationship
	{
		public static const ONE_TO_ONE		:String = "ONE_TO_ONE";
		public static const ONE_TO_MANY		:String = "ONE_TO_MANY";
		
		private var _propFrom				:String;
		private var _propTo					:String;
		private var _toEntitySet			:EntitySet
		private var _type					:String;
		private var _propNavigator			:String;
		private var _deleteCascate			:Boolean;
		
		public function EntitySetRelationship(propFrom:String, propTo:String, toEntitySet:EntitySet, type:String, propNavigator:String, deleteCascate:Boolean) 
		{
			_propFrom 			= propFrom;
			_propTo 			= propTo;
			_toEntitySet 		= toEntitySet;
			_type 				= type;
			_propNavigator 		= propNavigator;
			_deleteCascate		= deleteCascate;
		}
		
		public function get propFrom()			:String 	{ return _propFrom; }
		public function get propTo()			:String 	{ return _propTo; }
		public function get toEntitySet()		:EntitySet 	{ return _toEntitySet; }
		public function get type()				:String 	{ return _type; }
		public function get propNavigator()		:String 	{ return _propNavigator; }
		public function get deleteCascate()		:Boolean 	{ return _deleteCascate; }
		
	}

}