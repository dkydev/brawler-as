package engine.system {
	
	import engine.entity.Entity;
	import engine.LevelManager;
	
	public class MotionSystem implements ISystem {
		
		private var _entities:Vector.<Entity>;
		
		private var _frictionX:Number = 1;
		private var _frictionY:Number = 1;
		private var _gravity:Number = 2;
		
		public function MotionSystem():void {
			
			_entities = new Vector.<Entity>();
			
		}
		/* INTERFACE engine.system.ISystem */
		public function update(levelManager:LevelManager):void {
			
			for each (var entity:Entity in _entities) {
				
				entity.position.x += entity.motion.velX;
				entity.position.y += entity.motion.velY;
				entity.position.z += entity.motion.velZ;
				
				entity.motion.velZ -= _gravity;
				
			}
			
		}
		public function addEntity(entity:Entity):void {
			
			removeEntity(entity);
			
			if (!entity.motion || !entity.position || !entity.sprite) return;
			
			_entities.push(entity);
			
		}
		public function removeEntity(entity:Entity):void {
			
			if (_entities.indexOf(entity) != -1) {
				_entities.splice(_entities.indexOf(entity), 1);
			}
			
		}
	}
}