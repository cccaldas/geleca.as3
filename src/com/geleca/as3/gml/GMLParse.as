package com.geleca.as3.gml 
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.layout.LayoutSettings;
	import com.geleca.as3.mvc.core.View;
	import com.geleca.as3.ui.component.UIComponent;
	import com.geleca.as3.util.BooleanUtil;
	import com.geleca.as3.util.ObjectUtil;
	
	import flash.display.Sprite;

	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class GMLParse 
	{
		private var _view			:View;
		private var _gml			:GML;
		private var _xml			:XML;
		
		public function GMLParse(view:View, gml:GML) 
		{
			_view 	= view;
			_gml	= gml;
			_xml	= _gml.data;
			
			var length:uint =  _xml.view.children().length();
			
			//GLog.log(xml.view.children().length());
			
			for (var i:int = 0; i < length; i++) 
			{
				//GLog.log(xml.data.vie
				parseSubComponents(parseComponent(XMLList(_xml.view.children()[i]), _view), XMLList(_xml.view.children()[i]));
				//addComponent(comp);
				//parseSubComponents(comp, XMLList(_gml.data.View.children()[i]));
				//comp.renderComponent();
			}
		}
		
		private function parseSubComponents(comp:Sprite, list:XMLList):void 
		{
			var length:uint =  list.children().length();
			var subComp:Sprite;
			
			for (var i:int = 0; i < length; i++) 
			{
				subComp = parseComponent(XMLList(list.children()[i]), comp);
				//comp.addComponent(subComp);
				parseSubComponents(subComp, XMLList(list.children()[i]));
			}
			//trace(this, "parseSubComponents", comp, list.children().length());
		}
		
		private function parseComponent(data:XMLList, container:Sprite):Sprite
		{
			//GLog.log(data);
			
			var length:uint = data.attributes().length();
			
			var prop:String;
			var value:String;
			var id:String;
			
			var component:Sprite;
			component = ObjectUtil.getObjectByClassName(data.@type);
			container.addChild(component);
			
			for (var i:int = 0; i < length; i++) 
			{
				prop 	= String(data.attributes()[i].name());
				value 	= String(data.attribute(data.attributes()[i].name()));
				id		= String(data.attribute("id"));
				
				GLog.log(component, prop + ":" + value);
				//component.setProp(prop, value);
				//component = _view[id]; 
				
				switch (prop) 
				{
					case "id":
						if(_view.hasOwnProperty(value))
							_view[value] = component;
						component.name = value;
					break;
					
					case "layout":
						parseLayout(component, value);
					break;
					
					case "hitArea":
						parseHitArea(component, value);
					break;
					
					case "type":
						
					break;
					
					default:
						setProperty(component, prop, value);
						//component[prop] = value;
					break;
				}
				//this[id] = component;
				//trace(this, "attribute", prop, data.attribute(data.attributes()[i].name()));
				//trace(this, component);
				
				
				//trace(this, "prop ", component[String(data.attributes[i].name())]);
				//trace(this, "prop ", component[String(data.attributes[i].name())]);
				//component[String(data.attributes[i].name())] = String(data.attribute(data.attributes()[i].name()));
			}
			
			return component;
			
			//return component;
		}
		
		private function parseHitArea(component:Sprite, value:String):void 
		{
			GLog.log();
			
			var props:Array = value.split(" ");
			
			component.hitArea = new HitArea(props[0], props[1], props[2], props[3], props[4]);
			component.addChild(component.hitArea);
			
			return;
			
			var sequence:Array = ["width", "height", "alpha", "fillColor", "lineColor"];
			
			//var hitArea:HitArea = HitArea
			
			for (var i:int = 0; i < props.length; i++) 
			{
				//var item: = props[i];
				
			}
		}
		
		private function parseLayout(comp:Sprite, layout:String):void 
		{
			var props:Array = layout.split("; ");
			var prop:Array;
			var settings:LayoutSettings = new LayoutSettings(null, null, "", "");
			
			for (var i:int = 0; i < props.length; i++) 
			{
				prop = String(props[i]).split(":");
				settings[prop[0]] = prop[1];
				
				//GLog.log([prop[0]], prop[1]);
				//var item: = props[i];
				
			}
			
			//GLog.log(settings.margin);
			
			if (settings.margin is String)
			{
				var margin:Array = String(settings.margin).split(" ");
				
				settings.margin = { };
				settings.margin.top 		= margin[0];
				settings.margin.right 		= margin[1];
				settings.margin.bottom 		= margin[2];
				settings.margin.left 		= margin[3];
				
				//GLog.log(settings.margin.top, settings.margin.right, settings.margin.bottom, settings.margin.left);
			}
			
			
			
			_view.app.layout.addElement(comp, settings);
			_view.app.layout.renderElement(comp);
		}
		
		private function setProperty(target:*, prop:*, value:*):void 
		{
			if (prop == "visible" || prop == "mouseEnabled" || prop == "mouseChildren" || prop == "buttonMode")
				value = BooleanUtil.parse(value);
			
			target[prop] = value;
		}
	}

}