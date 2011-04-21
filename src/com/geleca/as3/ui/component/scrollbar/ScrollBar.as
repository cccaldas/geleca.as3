package simbionte.ui.component.scrollbar 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import simbionte.asset.scrollbar.MarkerButtonAsset;
	import simbionte.asset.scrollbar.TrackerSpriteAsset;
	import simbionte.asset.scrollbar.UpDownButtonAsset;
	import simbionte.ui.component.Component;
	import simbionte.geom.Geom;
	import simbionte.ui.component.button.Button;
	import simbionte.utils.TransformUtil;
	
	public class ScrollBar extends Component
	{
		protected var maskArea					:Rectangle; //máscara do container
		protected var container					:Sprite; //container que terá o scroll
		protected var buttonUp					:Button; //botão de cima
		protected var buttonDown				:Button; //botão de baixo
		protected var marker					:Button; //botão do meio
		protected var tracker					:Sprite; //barra entre botão de cima e de baixo
		
		private var _scrollDirection			:Number = 0;
        private var _scrollSpeed				:Number = 10;
		private var _timer						:Timer = new Timer(2);
		
		private var _scrollEnabled				:Boolean = true;
		
		private var _height						:Number = 0;
		
		public function ScrollBar(maskArea:Rectangle, container:Sprite, buttonUp:Button=null, buttonDown:Button=null, marker:Button=null, tracker:Sprite=null) 
		{
			this.maskArea 		= maskArea;
			this.container 		= container;
			this.buttonUp 		= buttonUp;
			this.buttonDown 	= buttonDown;
			this.marker 		= marker;
			this.tracker 		= tracker;
			
			if (!buttonUp)
			{
				var buttonUp:Button = new Button();
				buttonUp.addChild(new UpDownButtonAsset());
				this.buttonUp = buttonUp;
			}
			if (!buttonDown)
			{
				var buttonDown:Button = new Button();
				buttonDown.addChild(new UpDownButtonAsset());
				TransformUtil.flipVertical(buttonDown.getChildAt(0));
				
				this.buttonDown = buttonDown;
			}
			if (!marker)
			{
				var markerButton:Button = new Button();
				markerButton.addChild(new MarkerButtonAsset());
				this.marker = markerButton;
			}
			if (!tracker)
				this.tracker = new TrackerSpriteAsset();
		}
		
		override protected function setAssets():void 
		{
			addChild(tracker);
			addChild(marker);
			
			addChild(buttonUp);
			addChild(buttonDown);
			
			super.setAssets();
		}
		
		override protected function setVariables():void 
		{
			container.scrollRect 	= maskArea;
			
			super.setVariables();
		}
		
		override protected function initialize():void 
		{	
			buttonUp.initializeComponent();
			buttonDown.initializeComponent();
			marker.initializeComponent();
			
			if (height == 0)
				height = 100;
			
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
		
		protected function align():void 
		{
			tracker.height 	= height - buttonUp.height - buttonDown.height;
			tracker.y 		= buttonUp.y + buttonUp.height;
			buttonDown.y 	= tracker.height + tracker.y;
		}
		
		override public function set height(value:Number):void 
		{
			_height = value;
			align();
		}
		
		override public function get height():Number
		{
			return _height;
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
			
			if (maskArea != null && container != null) 
			{
				if (_scrollEnabled) 
				{
					//atualizando a scroll
					var Y:Number = (containerHeight - maskArea.height) * (scrollPercent / 100);
					
					//verifica se há necessidade de scroll
					if (container.scrollRect.y != Y)
						slideScroll(Y);
					
					//arrows
					marker.y += _scrollDirection * scrollSpeed;
				}
			}
			
			_scrollEnabled = containerHeight > maskArea.height;
		}
		
		private function marker_pressed(e:MouseEvent):void 
		{
			marker.startDrag(false, new Rectangle(tracker.x, tracker.y, 0, tracker.height - marker.height));
            stage.addEventListener(MouseEvent.MOUSE_UP, marker_stopSliding);
		}
		
		private function marker_stopSliding(e:MouseEvent):void 
		{
			marker.stopDrag();
            stage.removeEventListener(MouseEvent.MOUSE_UP, marker_stopSliding);
		}
		
		private function tracker_mouseWheel(e:MouseEvent):void 
		{
			marker.y -= e.delta * scrollSpeed;
		}
		
		private function tracker_click(e:MouseEvent):void 
		{
			marker.y = (tracker.mouseY * tracker.scaleY) + tracker.y;
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
			marker.destroy();
			
			tracker.removeEventListener(MouseEvent.MOUSE_WHEEL,		tracker_mouseWheel);
			tracker.removeEventListener(MouseEvent.CLICK, 			tracker_click);
			container.removeEventListener(MouseEvent.MOUSE_WHEEL, 	tracker_mouseWheel);
			_timer.removeEventListener(TimerEvent.TIMER, 			timer_timer);
			
			container.scrollRect = null;
			
			maskArea 		= null;
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