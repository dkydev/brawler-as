package engine.component {
	
	import engine.entity.Entity;
	import engine.GameEngine;
	import flash.ui.Keyboard;
	import io.InputConfiguration;
	import io.InputEvent;
	
	public class InputComponent implements IComponent {
		
		private var _inputConfig:InputConfiguration;
		private var _entity:Entity;
		
		public function InputComponent(entity:Entity):void {
			
			_inputConfig = InputConfiguration.getConfig(entity.entityID);
			_entity = entity;
			enable();
			
		}
		public function enable():void {
			
			_inputConfig.left.addEventListener(InputEvent.CHANGED, inputChanged);
			_inputConfig.right.addEventListener(InputEvent.CHANGED, inputChanged);
			_inputConfig.up.addEventListener(InputEvent.CHANGED, inputChanged);
			_inputConfig.down.addEventListener(InputEvent.CHANGED, inputChanged);
			_inputConfig.punch.addEventListener(InputEvent.CHANGED, inputChanged);
			_inputConfig.jump.addEventListener(InputEvent.CHANGED, inputChanged);
			
		}
		public function disable():void {
			
			_inputConfig.left.removeEventListener(InputEvent.CHANGED, inputChanged);
			_inputConfig.right.removeEventListener(InputEvent.CHANGED, inputChanged);
			_inputConfig.up.removeEventListener(InputEvent.CHANGED, inputChanged);
			_inputConfig.down.removeEventListener(InputEvent.CHANGED, inputChanged);
			_inputConfig.punch.removeEventListener(InputEvent.CHANGED, inputChanged);
			_inputConfig.jump.removeEventListener(InputEvent.CHANGED, inputChanged);
			
		}
		private function inputChanged(e:InputEvent):void {
			
			switch (e.input) {
				case _inputConfig.left:
					_entity.action["left"] = _inputConfig.left.value;
				break;
				case _inputConfig.right:
					_entity.action["right"] = _inputConfig.right.value;
				break;
				case _inputConfig.up:
					_entity.action["up"] = _inputConfig.up.value;
				break;
				case _inputConfig.down:
					_entity.action["down"] = _inputConfig.down.value;
				break;
				case _inputConfig.punch:
					_entity.action["punch"] = _inputConfig.punch.value;
				break;
				case _inputConfig.jump:
					_entity.action["jump"] = _inputConfig.jump.value;
				break;
			}
			
		}
	}
}