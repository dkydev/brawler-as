package {

	import engine.GameEngine;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import io.keyboard.KeyboardHandler;
	
	[SWF(width='800',height='600',backgroundColor='#222222',frameRate='60')]
	
	public class Main extends Sprite {
		
		public static var instance:Main;

		private var _engine:GameEngine;
		
		public function Main():void {
			
			Main.instance = this;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			KeyboardHandler.initialize(stage);
			Console.initialize(stage);
			
			_engine = new GameEngine();
			//_engine.start();
			
		}
		private function deactivate(e:Event):void {
			
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
			
		}	
	}
}