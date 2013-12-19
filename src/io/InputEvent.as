package io {
	
	import flash.events.Event;
	
	public class InputEvent extends Event {
		
		public static const PRESSED:String = "pressed";
		public static const RELEASED:String = "released";
		public static const CHANGED:String = "changed";
		
		private var _input:Input;
		
		public function InputEvent(input:Input, eventType:String, bubbles:Boolean = false, cancelable:Boolean = false):void {
			super(eventType, bubbles, cancelable);
			_input = input;
		}		
		public function get input():Input {
			return _input;
		}
	}
}