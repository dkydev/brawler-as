package io.controller {
	
	import flash.events.Event;
	import flash.ui.GameInputControl;
	import io.Input;
	import io.InputEvent;
	import utils.Console;
	
	public class ControllerInput extends Input {
		
		private var gameInputControl:GameInputControl;
		private var minRange:Number;
		private var maxRange:Number;
		private var absValue:Number;
		private var oldValue:Number;
		
		public function ControllerInput(name:String, gameInputControl:GameInputControl, minRange:Number = 0.5, maxRange:Number = 1):void {
			_name = name;			
			this.minRange = minRange;
			this.maxRange = maxRange;
			this.gameInputControl = gameInputControl;
			this.gameInputControl.addEventListener(Event.CHANGE, changeEvent);
		}		
		private function changeEvent(event:Event):void {
			oldValue = _value;
			_value = (event.target as GameInputControl).value;			
			absValue = Math.abs(_value);
			if (absValue >= minRange && oldValue < minRange) {
				pressed();
			}
			else if (absValue < minRange && oldValue >= minRange) {
				released();
			}
			event.preventDefault();
			if (_value != oldValue) {
				changed();
			}
		}		
		public override function get isDown():Boolean {
			return absValue >= minRange && absValue <= maxRange;
		}
	}
}