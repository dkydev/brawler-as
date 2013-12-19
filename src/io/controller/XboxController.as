package io.controller {
	
	import flash.ui.GameInputControl;
	import flash.ui.GameInputDevice;
	import utils.Console;
	
	public class XboxController extends Controller {
		
		public function XboxController(device:GameInputDevice):void {			
			
			_name = "Xbox Controller";
			mapDeviceControls(device);
			
		}
		public override function mapDeviceControls(device:GameInputDevice):void {
			
			_device = device;
			_deviceID = device.id;
			
			var controlMap:Object = new Object();
			var control:GameInputControl;
			for (var i:uint = 0; i < _device.numControls; i++) {
				control = _device.getControlAt(i);
				controlMap[control.id] = control;
			}
			
			BUTTON_N			= new ControllerInput("Y Button", controlMap["BUTTON_7"]);
			BUTTON_E			= new ControllerInput("B Button", controlMap["BUTTON_5"]);
			BUTTON_S 			= new ControllerInput("A Button", controlMap["BUTTON_4"]);
			BUTTON_W			= new ControllerInput("X Button", controlMap["BUTTON_6"]);
			LEFT_BUMPER 		= new ControllerInput("Left Bumper", controlMap["BUTTON_8"]);
			LEFT_TRIGGER 		= new ControllerInput("Left Trigger", controlMap["BUTTON_10"]);
			LEFT_STICK_XAXIS 	= new ControllerInput("Left Joystick X-Axis", controlMap["AXIS_0"]);
			LEFT_STICK_YAXIS 	= new ControllerInput("Left Joystick Y-Axis", controlMap["AXIS_1"]);
			LEFT_STICK 			= new ControllerInput("Left Joystick Down", controlMap["BUTTON_14"]);
			RIGHT_BUMPER 		= new ControllerInput("Right Bumper", controlMap["BUTTON_9"]);
			RIGHT_TRIGGER 		= new ControllerInput("Right Trigger", controlMap["BUTTON_11"]);
			RIGHT_STICK_XAXIS 	= new ControllerInput("Right Joystick X-Axis", controlMap["AXIS_2"]);
			RIGHT_STICK_YAXIS 	= new ControllerInput("Right Joystick Y-Axis", controlMap["AXIS_3"]);
			RIGHT_STICK 		= new ControllerInput("Right Joystick Down", controlMap["BUTTON_15"]);
			UP 					= new ControllerInput("Up", controlMap["BUTTON_16"]);
			DOWN 				= new ControllerInput("Down", controlMap["BUTTON_17"]);
			LEFT 				= new ControllerInput("Left", controlMap["BUTTON_18"]);
			RIGHT 				= new ControllerInput("Right", controlMap["BUTTON_19"]);	
			
		}
	}
}