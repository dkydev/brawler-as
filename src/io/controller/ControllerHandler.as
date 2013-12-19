package io.controller {
	
	import flash.events.EventDispatcher;
	import flash.events.GameInputEvent;
	import flash.ui.GameInput;
	import flash.ui.GameInputDevice;
	import utils.Console;

	public class ControllerHandler {
		
		private static var dispatcher:EventDispatcher;
		private static var _controllers:Vector.<Controller>;
		private static var _gameInput:GameInput;

		public static function initialize():void {			
			dispatcher = new EventDispatcher();
			_controllers = new Vector.<Controller>();
			_gameInput = new GameInput();
			_gameInput.addEventListener(GameInputEvent.DEVICE_ADDED, onDeviceAdded);
			_gameInput.addEventListener(GameInputEvent.DEVICE_REMOVED, onDeviceRemoved);
			for (var i:uint = 0; i < GameInput.numDevices; i++) {
				addDevice(GameInput.getDeviceAt(i));
			}
		}
		public static function addEventListener(type:String, listener:Function):void {
			dispatcher.addEventListener(type, listener);
		}
		public static function removeEventListener(type:String, listener:Function):void {
			dispatcher.removeEventListener(type, listener);
		}
		public static function get controllers():Vector.<Controller> { 			
			return _controllers;			
		}
		private static function onDeviceAdded(event:GameInputEvent):void {			
			addDevice(event.device);
		}
		private static function onDeviceRemoved(event:GameInputEvent):void {
			var controller:Controller = getControllerByDevice(event.device);
			if (controller) {
				Console.log(controller, "disconnected");
				dispatcher.dispatchEvent(new ControllerEvent(controller, ControllerEvent.DISCONNECTED));
			} else {
				Console.log("unknown device disconnected");
			}
			//event.device.enabled = false;						
		}
		private static function getControllerByDevice(device:GameInputDevice):Controller {			
			for (var i:int = 0; i < _controllers.length; i++) {
				if (_controllers[i].device == device)
					return _controllers[i];
			}
			return null;
		}
		private static function addDevice(device:GameInputDevice):void {			
			device.enabled = true;
			var controller:Controller;
			for (var i:int = 0; i < _controllers.length; i++) {
				controller = _controllers[i];				
				if (controller.deviceID == device.id) {					
					Console.log(controller, "reconnected");
					controller.mapDeviceControls(device);
					dispatcher.dispatchEvent(new ControllerEvent(_controllers[i], ControllerEvent.RECONNECTED));					
					return;	
				}				
			} 
			if (device.name.toLowerCase().indexOf("ouya") != -1) {
				controller = new OuyaController(device);
				_controllers.push(controller);
				Console.log(controller, "connected");
				dispatcher.dispatchEvent(new ControllerEvent(controller, ControllerEvent.CONNECTED));						
			} else if (device.name.toLowerCase().indexOf("xbox") != -1) {				
				controller = new XboxController(device);
				_controllers.push(controller);
				Console.log(controller, "connected");
				dispatcher.dispatchEvent(new ControllerEvent(controller, ControllerEvent.CONNECTED));
			} else {
				Console.log("unknown device connected");
			}
		}		
	}
}
