package io.keyboard {
	
	import io.Input;
	
	public class KeyboardInput extends Input {
		
		private var _keyCode:int;
		
		public function KeyboardInput(keyCode:int, name:String=""):void {			
			_keyCode = keyCode;
			_name = name;
		}		
		public function get keyCode():int {
			return _keyCode;
		}		
		public function set value(value:Number):void {			
			if (value > _value) {
				pressed();
			}
			else if (value < _value) {
				released();
			}			
			if (_value != value) {
				_value = value;
				changed();
			}
		}
	}
}