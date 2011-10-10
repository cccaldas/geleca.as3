package com.geleca.as3.component
{
	import com.geleca.as3.core.IDestroyable;
	import com.geleca.as3.layout.Layout;

	public interface IComponent extends IDestroyable
	{
		function get initialized():Boolean;
		
		function get enabled():Boolean;
		function set enabled(value:Boolean):void
			
		function get selected():Boolean;
		function set selected(value:Boolean):void
			
		function get layout():Layout;
		function set layout(value:Layout):void
			
		function get parent():IComponent;
		function set parent(value:IComponent):void;
		
		function addComponent(component:IComponent):*;
		function removeComponent(component:IComponent):*;
			
		function move(x:Number, y:Number):void
		function resize(width:Number, height:Number):void
			
		function get state():String
		function set state(value:String):void
			
		function setup():void;
		function init():void;
		//function addComponent(component:IComponent):IComponent
		function initializeComponent():*;
	}
}