package com.geleca.as3.test.website.view.component.loader.preloader
{
	import caurina.transitions.Tweener;
	
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.effects.transition.FadeTransition;
	import flash.display.Sprite;
	import com.geleca.as3.component.preloader.Preloader;

	public class AppLoaderPreloader extends Preloader
	{
		public function AppLoaderPreloader(asset:Sprite)
		{
			super(asset);
			
			//hitArea = new HitArea(160, 80, 0);
		}
		
		override public function setup():void
		{
			super.setup();
			
			alpha = 0;
			sp_progress.scaleX = 0;
		}
		
		override protected function updateProgress():void
		{
			super.updateProgress();
			
			
			Tweener.addTween(sp_progress, { time:.3, scaleX:this.progress });
		}
		
		public function show():void
		{
			FadeTransition.fadeIn(this, .5);
		}
		
		public function hide():void
		{
			FadeTransition.fadeOut(this);
		}
		
		public function get sp_progress():Sprite { return asset["sp_progress"]; }
	}
}