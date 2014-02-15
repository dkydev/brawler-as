package engine.system {
	
	import engine.entity.Entity;
	import engine.LevelManager;
	
	public class MotionSystem implements ISystem {
		
		private var _entities:Vector.<Entity>;
		
		private var _frictionX:Number = 1;
		private var _frictionY:Number = 1;
		private var _gravity:Number = -2;
		
		public function MotionSystem():void {
			
			_entities = new Vector.<Entity>();
			
		}
		/* INTERFACE engine.system.ISystem */
		public function update(levelManager:LevelManager):void {
			
			for each (var entity:Entity in _entities) {				
				
				entity.motion.velocity.y += entity.motion.gravity;
				
				entity.position.position.incrementBy(entity.motion.velocity);			
				
				
				//entity.position.x += entity.motion.velocity.x;
				//entity.position.y += entity.motion.velocity.y;
				//entity.position.z += entity.motion.velocity.z;
				
				entity.motion.onGround = false;
				
				if (entity.position.y <= 0) {
					entity.position.y = 0;
					entity.motion.velocity.y = 0;
					entity.motion.onGround = true;
					entity.motion.velocity.x *= entity.motion.friction;				
					entity.motion.velocity.z *= entity.motion.friction;
				} else {
					entity.motion.onGround = false;					
				}
				
			}
			
		}
		public function addEntity(entity:Entity):void {
			
			removeEntity(entity);
			
			if (!entity.motion || !entity.position || !entity.collision) return; // !entity.renderable) return;
			
			_entities.push(entity);
			
		}
		public function removeEntity(entity:Entity):void {
			
			if (_entities.indexOf(entity) != -1) {
				_entities.splice(_entities.indexOf(entity), 1);
			}
			
		}
	}
}