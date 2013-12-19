package io.controller {
	
	import flash.events.EventDispatcher;
	import flash.ui.GameInputControl;
	import flash.ui.GameInputDevice;
	import utils.Console;
	
	public class Controller {
		
		protected var _name:String = "undefined controller";
		protected var _device:GameInputDevice;
		protected var _deviceID:String; // xbox controller device.id is lost after disconnect.. WWWWWHHYYY
		
		public var BUTTON_N:ControllerInput;
		public var BUTTON_E:ControllerInput;
		public var BUTTON_S:ControllerInput;
		public var BUTTON_W:ControllerInput;
		public var LEFT_BUMPER:ControllerInput;
		public var LEFT_TRIGGER:ControllerInput;
		public var LEFT_STICK_XAXIS:ControllerInput;
		public var LEFT_STICK_YAXIS:ControllerInput;
		public var LEFT_STICK:ControllerInput;
		public var RIGHT_BUMPER:ControllerInput;
		public var RIGHT_TRIGGER:ControllerInput;
		public var RIGHT_STICK_XAXIS:ControllerInput;
		public var RIGHT_STICK_YAXIS:ControllerInput;
		public var RIGHT_STICK:ControllerInput;	
		public var UP:ControllerInput;
		public var DOWN:ControllerInput;
		public var LEFT:ControllerInput;
		public var RIGHT:ControllerInput;
		
		public function mapDeviceControls(device:GameInputDevice):void { }
		public function get device():GameInputDevice { return _device; }
		public function toString():String { return _name; }
		public function get deviceID():String { return _deviceID; }
	}
}
