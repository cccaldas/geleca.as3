/**
 * EventManager class 		
 * 		This class keeps track of listeners being used. This class is VERY useful in development and is HIGHLY recommended to be used.
 * 		Instead of 		MyObj.addEventListener(Event.ENTER_FRAME, someFunction, false, 0, true)
 * 				do: 	EventManager.addEventListener(MyObj,Event.ENTER_FRAME, someFunction);
 * 
 * 	NOTES:
 * 		- Please know that in calling removeAllListeners(), if all of the filter parameters are null, then every single listener will be removed!
 * 			So make sure if you put in parameters that they are NOT null (unless you want to remove all the listeners from the program) 
 *  
 *	@version 1.3			5/22/09
 * 		- Added static addEventListeners (author: Dennin Dalke)
 * 		- Added static variable SHOW_WARNING which warns win all listeners are being removed.
 *	@version 1.23			10/11/08
 * 		- Added cleanUp and cleanUpObject. These methods will check to see if any objects had listeners removed already. For example, weak reference set to true so the object deletes listeners. Or user uses EventDispatcher removeEventListener rather than EventManager's by accident.
 * 		- I'm not sure if hasEventListener is more appropriate in cleanUp than willTrigger, but I'm putting that in for now. 
 *	@version 1.21			10/7/08
 * 		- Fixed bug in remove all listeners (accidently put && instead of ||) should work as expected now
 * 		- Added getMap to return an array
 * 		- deepTrace and objectTrace returns (somewhat) formatted string 
 *  @version 1.2			9/30/08
 * 		- useWeakReference set to true by default
 * 		- actuallyAddListener set to true by default
 * @version 1.1
 * 		- Added removeAllListeners filtering.
 * @version 1.0
 * 		- Does not support distinguishing capture and non capture events
 * 
 * @author Danny Miller
 * k2xl@k2xl.com
 */
package com.geleca.as3.events
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	public class EventManager
	{
		/**
		 * objectMap is a Dictionary object. Dictionary uses objects as keys instead of strings... although I am a bit confused if it just uses the toString of an object or the actual memory location...
		 * weakKeys set to true (otherwise examples using objects such as timers won't work as expected)
		 */
		private static var objectMap:Dictionary = new Dictionary(true);
		public static var SHOW_WARNING:Boolean = false;
		public function EventManager()
		{
		}
		
		/**
		 * @param actuallyAddListener Adds the listener to the object. Sometimes you'll want to manually add the event listener and then call this function. For example, a class that overrides addEventListener will want to call this function with actuallyAddListener set to false and call super.addEventListener. 
		 */ 
		public static function addEventListener(obj:IEventDispatcher,type:String,listener:Function,useCapture:Boolean=false,priority:int=0, useWeakReference:Boolean=true, actuallyAddListener:Boolean=true):void
		{
			if (actuallyAddListener)
				obj.addEventListener(type,listener,useCapture,priority,useWeakReference);
			if (objectMap[obj] == null)
			{
				objectMap[obj] = new Dictionary();
				objectMap[obj].numListeners = 0;
			}
			if (objectMap[obj][type] == null)
			{
				objectMap[obj].numListeners++;
				objectMap[obj][type] = new Array();
				(objectMap[obj][type] as Array).push(obj,type); // You can't access keys of a dictionary, so might as well put need info as first index
			}
			(objectMap[obj][type] as Array).push(listener);
			//trace(describeType[obj]);
		}
		/**
		 * Adds multiple listeners to function
		 * @author Dennin Dalke
		 * @exampleText 
		 * 	EventManager.addEventListeners( loader.contentLoaderInfo, [
				ProgressEvent.PROGRESS,	onSiteLoad_Progress,
				Event.OPEN,				onSiteLoad_Open,
				Event.COMPLETE,			onSiteLoad_Complete,
				IOErrorEvent.IO_ERROR,	onSiteLoad_IOError
			] );
		 */
		public static function addEventListeners(obj:IEventDispatcher, eventListeners:Array, useCapture:Boolean=false,priority:int=0, useWeakReference:Boolean=true, actuallyAddListener:Boolean=true):void
        {
            for ( var i:int = 0; i < eventListeners.length; i += 2 )
            {
                trace( eventListeners[ i ], eventListeners[ i + 1] );
               
                addEventListener( obj, eventListeners[ i ] as String, eventListeners[ i + 1] as Function, useCapture, priority, useWeakReference, actuallyAddListener );
            }
        }
		/**
		 * @param actuallyRemoveListener is similar to actuallyAddListener in addEventListener
		 */
		public static function removeEventListener(obj:IEventDispatcher,type:String,listener:Function,useCapture:Boolean=false, actuallyRemoveListener:Boolean = true):void
		{
			if (actuallyRemoveListener)
				obj.removeEventListener(type,listener,useCapture);
			if (objectMap[obj] == null)
			{
				//trace("Couldn't find listener to remove (type = "+type+" from "+obj+")");
				return;
			}
			var arr:Array = objectMap[obj][type];
			if (arr == null)
			{
				// if obj overrides remove event listener, it better have removeListener set to false when it calls so that this block is encountered.
				return;
			}
			var tempS:int = arr.length;
			for (var i:int = 2; i <  tempS; i++)
			{
				if (arr[i] == listener)
				{
					arr.splice(i,1);
				}				
			}
			if (arr.length == 2) // only object and type indexes left...
			{
				objectMap[obj][type] = null;
				// If no more listeners exist on this object...
				objectMap[obj].numListeners--;
				if (objectMap[obj].numListeners == 0)
				{
					objectMap[obj] = null;
				}
			}
		}
		/**
		 * Removes all the listeners from a given object that has used the EventManager class
		 * @param objectFilter The object to be targeted, null for any object.
		 */
		public static function removeAllListeners(objectFilter:IEventDispatcher = null, typeFilter:String = null, functionFilter:Function = null):void
		{
			if (SHOW_WARNING && objectFilter==null && typeFilter == null && functionFilter == null)
			{
				trace("EventManager warning! A call to removeAllListeners had all null parameters (meaning all listeners are being removed). You might want to check your filters. (Turn off this warning by setting EventManager.SHOW_WARNING to false.)");
			}
			for (var obj:Object in objectMap)
			{
				if (objectFilter != null) 
				{
					obj = objectFilter;
				}
				var tempobj:Object = objectMap[obj];
				for each (var temp:Object in tempobj)
				{
					if ((temp is Number || temp==null) || (typeFilter != null && temp[1]!=typeFilter) || (functionFilter != null && temp[2]!=functionFilter)) { continue; }; // length property
					removeEventListener(temp[0],temp[1],temp[2],false,true);
				}
				if (objectFilter != null) { break; };
			}
			
			//MonsterDebugger.trace(objectFilter, deepTrace());
		}
		
		/**
		 * Traces all the listeners in memory (that have used this class)
		 */
		public static function deepTrace():String
		{
			var str:String="";
			var count:int = 0;
			var prevObj:Object = new Object();
			for each (var type:Object in objectMap)
			{
				for each (var type2:Object in type)
				{
					
					if (type2 is Number || type2 == null) { continue; }
					if (type2[0] == prevObj) { continue; }
					str+=objectTrace(type2[0] as IEventDispatcher)+"\n";
					if (objectMap[type2[0]] != null)
					count+=objectMap[type2[0]].numListeners;
					prevObj = type2[0];
				}
			}
			str+="\nTotal Listeners: "+count
			return str;
		}
		public static function getMap():Dictionary
		{
			return objectMap;
		}
		/**
		 * Cycles through all the EventDispatcher objects and removes the ones that don't actually have the listener anymore.
		 * Consequently, if you use removeEventListener from EventDispatcher rather than here, the Dictionary in here will still think you haven't removed it. Calling cleanUp can fix this problem (unless you have the same event listener for multiple functions)
		 */
		public static function cleanUp():void
		{
			var prevObj:Object = new Object();
			for each (var type:Object in objectMap)
			{
				for each (var type2:Object in type)
				{
					if (type2 is Number || type2 == null) { continue; }
					if (type2[0] == prevObj) { continue; }
					cleanUpObject(type2[0] as IEventDispatcher)+"\n";
					prevObj = type2[0];
				}
			}
		}
		public static function cleanUpObject(obj:IEventDispatcher):void
		{
			if (objectMap[obj] == null) 
			{ 
				return; 
			}			
			for each (var type:Object in objectMap[obj])
			{
				if (type is Number || type == null){continue; } // length property
				var num:int = (objectMap[obj][type[1]] as Array).length-2; // first 2 parameters are obj, event
				
				if (! ((type[0] as EventDispatcher).hasEventListener(type[1])) )
				{ 
					removeEventListener(type[0],type[1],type[2]);  
				}
			} 
		}
		/**
		 * Traces all the listeners in memory of a particular object
		 */
		public static function objectTrace(obj:IEventDispatcher):String
		{
			cleanUpObject(obj);
			var str:String = "";
			if (objectMap[obj] == null) 
			{ 
				str+= ""+obj+" has no listeners in EventManager (or gc got it)\n";
				return str; 
			}			
			str+=(obj + " has "+objectMap[obj].numListeners+" listeners \n\t");
			for each (var type:Object in objectMap[obj])
			{
				if (type is Number || type == null){continue; } // length property
				var num:int = (objectMap[obj][type[1]] as Array).length-2; // first 2 parameters are obj, event
				
				str+=""+num+" listeners of "+type[1]+", ";
			}
			str = str.substr(0,str.length-2);
			str+="";
			return str; 
		} 
	}
}