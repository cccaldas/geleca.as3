package gml 
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.layout.LayoutSettings;
	import com.geleca.as3.mvc.core.View;
	import com.geleca.as3.ui.component.Component;
	import com.geleca.as3.util.BooleanUtil;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class GMLApply 
	{
		private var _view			:View;
		private var _xml			:XML;
		
		public function GMLApply(view:View, xml:XML) 
		{
			_view 	= view;
			_xml	= xml;
			
			var length:uint =  xml.view.children().length();
			
			//GLog.log(xml.view.children().length());
			
			for (var i:int = 0; i < length; i++) 
			{
				//GLog.log(xml.data.vie
				parseComponent(XMLList(xml.view.children()[i]));
				//addComponent(comp);
				//parseSubComponents(comp, XMLList(_gml.data.View.children()[i]));
				//comp.renderComponent();
			}
		}
		
		/*private function parseSubComponents(comp:UIComponent, list:XMLList):void 
		{
			var length:uint =  list.children().length();
			for (var i:int = 0; i < length; i++) 
			{
				parseComponent(XMLList(list.children()[i]));
				//comp.addComponent(subComp);
				parseSubComponents(subComp, XMLList(list.children()[i]));
				subComp.renderComponent();
			}
			//trace(this, "parseSubComponents", comp, list.children().length());
		}*/
		
		private function parseComponent(data:XMLList):void
		{
			//GLog.log(data);
			
			var length:uint = data.attributes().length();
			
			var prop:String;
			var value:String;
			var id:String;
			
			var component:Sprite;
			
			for (var i:int = 0; i < length; i++) 
			{
				prop 	= String(data.attributes()[i].name());
				value 	= String(data.attribute(data.attributes()[i].name()));
				id		= String(data.attribute("id"));
				
				//trace(this, component, prop + ":" + value);
				//component.setProp(prop, value);
				component = _view[id];
				
				switch (prop) 
				{
					case "id":
						
					break;
					
					case "layout":
						parseLayout(component, value);
					break;
					
					case "hitArea":
						parseHitArea(component, value);
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
			
			//return component;
		}
		
		private function parseHitArea(component:Sprite, value:String):void 
		{
			var sequence:Array = ["width", "height", "alpha", "fillColor", "lineColor"];
			var props:Array = value.split(" ");
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
				
				GLog.log(settings.margin.top, settings.margin.right, settings.margin.bottom, settings.margin.left);
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