package simbionte.ui.component.form 
{
	import simbionte.display.HitArea;
	import simbionte.ui.component.data.ItemTemplate;
	import simbionte.ui.component.label.Label;
	
	public class ComboBoxItemTemplate extends ItemTemplate
	{
		public var lbl_label								:Label = new Label();
		private var _width									:Number = 120;
		
		public function ComboBoxItemTemplate() 
		{
			hitArea = new HitArea(120, 20);
			hitArea.alpha = .5;
		}
		
		override protected function setAssets():void 
		{
			addChild(lbl_label);
			
			super.setAssets();
		}
		
		override protected function initialize():void 
		{
			lbl_label.initializeComponent();
			
			super.initialize();
		}
		
		override protected function bind():void 
		{
			lbl_label.text = dataSource.label;
			
			super.bind();
		}
		
		override protected function enable():void 
		{
			alpha = 1;
			
			super.enable();
		}
		
		override protected function disable():void 
		{
			alpha = .3;
			
			super.disable();
		}
		
		override public function get width():Number { return _width; }
		
		override public function set width(value:Number):void 
		{
			_width = value;
			hitArea.width = value;
		}
		
	}

}