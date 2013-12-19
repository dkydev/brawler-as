package io.controller {
	
	import flash.events.Event;

	public class ControllerEvent extends Event {
		
		public static const CONNECTED:String 	= "connected";
		public static const DISCONNECTED:String = "disconnected";
		public static const RECONNECTED:String 	= "reconnected";
		
		private var _controller:Controller;
		
		public function ControllerEvent(controller:Controller, type:String, bubbles:Boolean=false, cancelable:Boolean=false) { 
			_controller = controller;
			super(type, bubbles, cancelable);
		}
		public function get controller():Controller {
			return _controller;
		}
	}
}