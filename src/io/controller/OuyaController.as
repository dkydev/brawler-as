package io.controller {
	
	import flash.ui.GameInputControl;
	import flash.ui.GameInputDevice;
	
	public class OuyaController extends Controller {
		
		public function OuyaController(device:GameInputDevice):void {	
			
			_name = "Ouya Controller";
			mapDeviceControls(_device);
			
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
			
			if (controlMap["BUTTON_100"] != null) { // Ouya
				BUTTON_S			= new ControllerInput("O Button", controlMap["BUTTON_96"]);
				BUTTON_W			= new ControllerInput("U Button",controlMap["BUTTON_99"]);
				BUTTON_N 			= new ControllerInput("Y Button", controlMap["BUTTON_100"]);
				BUTTON_E			= new ControllerInput("A Button", controlMap["BUTTON_97"]);
				LEFT_BUMPER 		= new ControllerInput("Left Bumper", controlMap["BUTTON_102"]);
				LEFT_TRIGGER 		= new ControllerInput("Left Trigger", controlMap["BUTTON_104"]);
				LEFT_STICK_XAXIS 	= new ControllerInput("Left Joystick X-Axis", controlMap["AXIS_0"]);
				LEFT_STICK_YAXIS 	= new ControllerInput("Left Joystick Y-Axis", controlMap["AXIS_1"]);
				LEFT_STICK 			= new ControllerInput("Left Joystick Down", controlMap["BUTTON_106"]);
				RIGHT_BUMPER 		= new ControllerInput("Right Bumper", controlMap["BUTTON_103"]);
				RIGHT_TRIGGER 		= new ControllerInput("Right Trigger", controlMap["BUTTON_105"]);
				RIGHT_STICK_XAXIS 	= new ControllerInput("Right Joystick X-Axis", controlMap["AXIS_11"]);
				RIGHT_STICK_YAXIS 	= new ControllerInput("Right Joystick X-Axis", controlMap["AXIS_14"]);
				RIGHT_STICK 		= new ControllerInput("Right Joystick Down", controlMap["BUTTON_107"]);
				UP 					= new ControllerInput("Up", controlMap["BUTTON_19"]);
				DOWN 				= new ControllerInput("Down", controlMap["BUTTON_20"]);
				LEFT 				= new ControllerInput("Left", controlMap["BUTTON_21"]);
				RIGHT 				= new ControllerInput("Right", controlMap["BUTTON_22"]);			
			} else { // PC
				BUTTON_S 			= new ControllerInput("O Button", controlMap["BUTTON_6"]);
				BUTTON_W 			= new ControllerInput("U Button", controlMap["BUTTON_7"]);
				BUTTON_N 			= new ControllerInput("Y Button", controlMap["BUTTON_8"]);
				BUTTON_E 			= new ControllerInput("A Button", controlMap["BUTTON_9"]);
				LEFT_BUMPER 		= new ControllerInput("Left Bumper", controlMap["BUTTON_10"]);
				LEFT_TRIGGER 		= new ControllerInput("Left Trigger", controlMap["BUTTON_18"]);
				LEFT_STICK_XAXIS 	= new ControllerInput("Left Joystick X-Axis", controlMap["AXIS_0"]);
				LEFT_STICK_YAXIS 	= new ControllerInput("Left Joystick Y-Axis", controlMap["AXIS_1"]);
				LEFT_STICK 			= new ControllerInput("Left Joystick Down", controlMap["BUTTON_12"]);
				RIGHT_BUMPER 		= new ControllerInput("Right Bumper", controlMap["BUTTON_11"]);
				RIGHT_TRIGGER 		= new ControllerInput("Right Trigger", controlMap["BUTTON_19"]);
				RIGHT_STICK_XAXIS 	= new ControllerInput("Right Joystick X-Axis", controlMap["AXIS_3"]);
				RIGHT_STICK_YAXIS 	= new ControllerInput("Right Joystick Y-Axis", controlMap["AXIS_4"]);
				RIGHT_STICK 		= new ControllerInput("Right Joystick Down", controlMap["BUTTON_13"]);
				UP 					= new ControllerInput("Up", controlMap["BUTTON_14"]);
				DOWN 				= new ControllerInput("Down", controlMap["BUTTON_15"]);
				LEFT 				= new ControllerInput("Left", controlMap["BUTTON_16"]);
				RIGHT 				= new ControllerInput("Right", controlMap["BUTTON_17"]);				
			}			
		}
	}
}