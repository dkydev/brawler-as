package io {
	
	import flash.ui.Keyboard;
	import io.keyboard.KeyboardHandler;
	
	public class InputConfiguration {
		
		// TODO: static input configs that will be changed through menus or whatever
		
		public static function getConfig(configID:String):InputConfiguration {
			
			var config:InputConfiguration = new InputConfiguration();
			
			switch (configID) {
				case "player1":
					config.left 	= KeyboardHandler.getInput(Keyboard.A);			
					config.right 	= KeyboardHandler.getInput(Keyboard.D);			
					config.up 		= KeyboardHandler.getInput(Keyboard.W);
					config.down 	= KeyboardHandler.getInput(Keyboard.S);
					config.jump 	= KeyboardHandler.getInput(Keyboard.SPACE);
					config.punch 	= KeyboardHandler.getInput(Keyboard.CONTROL);
				break;
				default:
					config.left 	= KeyboardHandler.getInput(Keyboard.LEFT);			
					config.right 	= KeyboardHandler.getInput(Keyboard.RIGHT);			
					config.up 		= KeyboardHandler.getInput(Keyboard.UP);
					config.down 	= KeyboardHandler.getInput(Keyboard.DOWN);
					config.jump 	= KeyboardHandler.getInput(Keyboard.COMMA);
					config.punch 	= KeyboardHandler.getInput(Keyboard.PERIOD);
				break;
			}
			
			return config;
			
		}
		
		public var left:Input;
		public var right:Input;
		public var up:Input;
		public var down:Input;
		public var punch:Input;
		public var jump:Input;
		
		public function InputConfiguration():void { }
		
	}
}