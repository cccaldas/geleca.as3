package simbionte.component.scrollbar 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import simbionte.component.button.Button;
	import simbionte.component.Component;
	import simbionte.geom.Geom;
	
	public class ScrollBar extends Component
	{
		protected var mask						:Sprite;
		protected var container					:Sprite;
		protected var buttonUp					:Button;
		protected var buttonDown				:Button;
		protected var marker					:Sprite;
		protected var tracker					:Sprite;
		
		private var _scrollDirection			:Number = 0;
        private var _scrollSpeed				:Number = 5;
		private var _timer						:Timer = new Timer(2);
		
		private var _scrollEnabled				:Boolean = true;
		
		public function ScrollBar(mask:Sprite, container:Sprite, buttonUp:Button, buttonDown:Button, marker:Sprite, tracker:Sprite) 
		{
			this.mask 			= mask;
			this.container 		= container;
			this.buttonUp 		= buttonUp;
			this.buttonDown 	= buttonDown;
			this.marker 		= marker;
			this.tracker 		= tracker;
		}
		
		override protected function setVariables():void 
		{
			mask.mouseEnabled = mask.mouseChildren = false;
			
			var rect	:Rectangle 	= Geom.getRectangleFromDisplayObject(mask);
			rect.x 					= rect.y = 0;
			container.scrollRect 	= rect;
			container.hitArea 		= mask;
			marker.y 				= tracker.y;
			
			super.setVariables();
		}
		
		override protected function initialize():void 
		{				
			_timer.start();
			
			super.initialize();
		}
		
		override protected function setListeners():void 
		{
			//buttons
			buttonUp.addEventListener(MouseEvent.MOUSE_DOWN, 	button_pressed);
			buttonUp.addEventListener(MouseEvent.MOUSE_UP, 		button_pressed);
			
            buttonDown.addEventListener(MouseEvent.MOUSE_DOWN, 	button_pressed);
            buttonDown.addEventListener(MouseEvent.MOUSE_UP, 	button_pressed);
			
			//marker
			marker.addEventListener(MouseEvent.MOUSE_DOWN, 		marker_pressed);
			marker.addEventListener(MouseEvent.MOUSE_WHEEL, 	tracker_mouseWheel);
			
			//tracker
			tracker.addEventListener(MouseEvent.MOUSE_WHEEL,	tracker_mouseWheel);
			tracker.addEventListener(MouseEvent.CLICK, 			tracker_click);
			
			//container
			container.addEventListener(MouseEvent.MOUSE_WHEEL, 	tracker_mouseWheel);
			
			_timer.addEventListener(TimerEvent.TIMER, 			timer_timer);
			
			super.setListeners();
		}
		
		private function button_pressed(e:MouseEvent):void
        {			
			switch (e.type) 
			{
				case MouseEvent.MOUSE_DOWN:
					_scrollDirection = (e.currentTarget == buttonUp) ? -.1 : .1;					
				break;
				
				case MouseEvent.MOUSE_UP:
					_scrollDirection = 0;
				break;
				
				case MouseEvent.MOUSE_WHEEL:
					
				break;
			}
        }
		
		private function timer_timer(e:TimerEvent):void 
		{			
			//acertando o posicionamento
			var yMax:Number = (tracker.height + tracker.y) - marker.height;
			var yMin:Number = tracker.y;
			if (marker.y > yMax) marker.y = yMax;
			if (marker.y < yMin) marker.y = yMin;
			
			if (mask != null && container != null) 
			{
				if (_scrollEnabled) 
				{
					//atualizando a scroll
					var Y:Number = (containerHeight - mask.height) * (scrollPercent / 100);
					//verifica se há necessidade de scroll
					if (container.scrollRect.y != Y)
					{
						//Tweener.addTween(container, { _scrollRect_y:Y, time:.6} );
						//container.scrollRect.y = Y;
						slideScroll(Y);
					}
					
					//arrows
					marker.y += _scrollDirection * scrollSpeed;
				}
			}
			
			_scrollEnabled = containerHeight > mask.height;
		}
		
		private function marker_pressed(e:MouseEvent):void 
		{
			marker.startDrag(false, new Rectangle(tracker.x, tracker.y, 0, tracker.height - marker.height));
            container.stage.addEventListener(MouseEvent.MOUSE_UP, marker_stopSliding);
		}
		
		private function marker_stopSliding(e:MouseEvent):void 
		{
			marker.stopDrag();
            container.stage.removeEventListener(MouseEvent.MOUSE_UP, marker_stopSliding);
		}
		
		private function tracker_mouseWheel(e:MouseEvent):void 
		{
			marker.y -= e.delta * scrollSpeed;
		}
		
		private function tracker_click(e:MouseEvent):void 
		{
			marker.y = (tracker.mouseY) / 100 * (tracker.y + tracker.height + marker.height);
		}
		
		protected function get scrollPercent():Number
		{ 
			return (marker.y - tracker.y) / (tracker.height - marker.height) * 100;
		}
		
		public function get containerHeight():Number
		{ 
			var virtualContainer:Sprite = new Sprite();
			
			for (var i:int = 0; i < container.numChildren; i++) 
			{
				var rect:Rectangle = Geom.getRectangleFromDisplayObject(container.getChildAt(i));
				virtualContainer.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
			}
			
			return virtualContainer.height; 
		}
		
		public function get scrollSpeed():Number { return _scrollSpeed; }
		public function set scrollSpeed(value:Number):void 
		{
			_scrollSpeed = value;
		}
		
		/**Método responsável por deslizar o scrollBar.*/
		protected function slideScroll(y:Number):void 
		{
			container.scrollRect = new Rectangle(	container.scrollRect.x,
													y,
													container.scrollRect.width,
													container.scrollRect.height
												);
		}
		
		override public function destroy():void 
		{
			buttonUp.destroy();
			buttonDown.destroy();
			
			marker.removeEventListener(MouseEvent.MOUSE_DOWN, 		marker_pressed);
			marker.removeEventListener(MouseEvent.MOUSE_WHEEL, 		tracker_mouseWheel);
			tracker.removeEventListener(MouseEvent.MOUSE_WHEEL,		tracker_mouseWheel);
			tracker.removeEventListener(MouseEvent.CLICK, 			tracker_click);
			container.removeEventListener(MouseEvent.MOUSE_WHEEL, 	tracker_mouseWheel);
			_timer.removeEventListener(TimerEvent.TIMER, 			timer_timer);
			
			mask 			= null;
			container 		= null;
			buttonUp 		= null;
			buttonDown 		= null;
			marker 			= null;
			tracker 		= null;
			_timer			= null;
			
			
			super.destroy();
		}
	}

}