package io {
	
	import flash.events.EventDispatcher;
	
	public class Input extends EventDispatcher {
		
		protected var _value:Number = 0;
		protected var _name:String;
		
		public function pressed():void {
			dispatchEvent(new InputEvent(this, InputEvent.PRESSED));
		}		
		public function released():void {
			dispatchEvent(new InputEvent(this, InputEvent.RELEASED));
		}
		public function changed():void {
			dispatchEvent(new InputEvent(this, InputEvent.CHANGED));
		}
		public function get isDown():Boolean {
			return _value == 1;
		}
		public function get value():Number {
			return _value;
		}
		public function get name():String {
			return _name;
		}
		public override function toString():String {
			return name;
		}
	}
}