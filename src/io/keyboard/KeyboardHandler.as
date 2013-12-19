package io.keyboard {
	
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import io.Input;
	
	public class KeyboardHandler {
		
		private static var inputControls:Vector.<KeyboardInput> = new Vector.<KeyboardInput>(255);
		public static var callback_keyDown:Vector.<Function> = new Vector.<Function>();
		public static var callback_keyUp:Vector.<Function> = new Vector.<Function>();
		
		public static function initialize(stage:Stage):void {			
			for (var i:int = 0; i < inputControls.length; i++)
				inputControls[i] = new KeyboardInput(i, "Key " + i);			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}		
		public static function getInput(keyCode:uint):Input {			
			return inputControls[keyCode];		
		}		
		private static function keyDown(e:KeyboardEvent):void {
			inputControls[e.keyCode].value = 1;			
			if (e.keyCode == 27 || e.keyCode == Keyboard.BACK) { // disable back button (ouya A button)
				e.preventDefault();
			}		
		}
		private static function keyUp(e:KeyboardEvent):void {
			inputControls[e.keyCode].value = 0;
		}
	}
}