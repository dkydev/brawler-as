package engine.system {
	
	import engine.entity.Entity;
	import engine.LevelManager;
	
	public class CollisionSystem implements ISystem {
		
		private var _entities:Vector.<Entity>;
		private var _collisionEvents:Vector.<CollisionEvent>;
		
		public function CollisionSystem():void {
			
			_entities = new Vector.<Entity>();
			_collisionEvents = new Vector.<CollisionEvent>();
			
		}		
		/* INTERFACE engine.system.ISystem */		
		public function update(levelManager:LevelManager):void {
			
			var e1:Entity, e2:Entity;			
			var dX:Number, dY:Number, dZ:Number;
			var i:uint, j:uint, l:uint;
			
			var aX:Number, aY:Number, aZ:Number;
			var d:Number;
			
			var dW:Number, dD:Number, dH:Number;
			
			l = _entities.length;
			for (i = 0; i < l; i++) {				
				e1 = _entities[i];
				e1.motion.onGround = false;				
				for (j = 0; j < l; j++) {
					if (_entities[j] == e1) continue;
					e2 = _entities[j];
					dW = (e1.position.width	* 0.5	+ e2.position.width 	* 0.5);
					dD = (e1.position.depth	* 0.5	+ e2.position.depth 	* 0.5);
					dH = (e1.position.height * 0.5 	+ e2.position.height	* 0.5);
					dX = Math.abs(e1.position.x + e1.motion.velX - e2.position.x + e2.motion.velX) - dW;
					dY = Math.abs(e1.position.y + e1.motion.velY - e2.position.y + e2.motion.velY) - dD;
					dZ = Math.abs(e1.position.z + e1.motion.velZ - e2.position.z + e2.motion.velZ) - dH;					
					if (dX <= 0 && dY <= 0 && dZ <= 0) {						
						
						d = Math.sqrt(Math.pow(e1.motion.velX, 2) + Math.pow(e1.motion.velY, 2) + Math.pow(e1.motion.velZ, 2));
						aX = c.dX / d;
						aY = c.dY / d;
						aZ = c.dZ / d;
						
						for (var i:int = 0; i < Math.ceil(a); i++) {
							
							dX = Math.abs(e1.position.x + aX - e2.position.x + e2.motion.velX) - dW;
							dY = Math.abs(e1.position.y + aY - e2.position.y + e2.motion.velY) - dD;
							dZ = Math.abs(e1.position.z + aZ - e2.position.z + e2.motion.velZ) - dH;
							
							if (dX <= 0 && dY <= 0 && dZ <= 0) {
								
								dX = 
								
							}
							
						}
						
						//_collisionEvents.push(new CollisionEvent(e1, e2, dX, dY, dZ));							
					}
				}				
			}
			
			//var c:CollisionEvent;
			//while (_collisionEvents.length > 0) {
				//c = _collisionEvents.pop();
				//
				//var a = Math.sqrt(c.dX * c.dX + c.dY * c.dY + c.dZ * c.dZ);
				//aX = c.dX / a;
				//aY = c.dY / a;
				//aZ = c.dZ / a;
				//
				//for (var i:int = 0; i < Math.ceil(a); i++) {
					//
					//
					//
				//}
				
				//if (c.e1.position.z > c.e2.position.z) c.dZ = 0.5 * dZ;
				//if (c.dZ < -10) {
					//if (c.e1.position.z > c.e2.position.z && c.e1.motion.velZ < 0) {						
						//c.e1.motion.onGround = true;
					//}
					//c.e1.motion.velZ = 0;
					//c.e1.motion.velX
				//} else {
					//if (Math.abs(c.dX) < Math.abs(c.dY)) {
						//c.e1.position.x += c.dX;
						//c.e1.motion.velX = 0;
					//} else {
						//c.e1.position.y += c.dY;
						//c.e1.motion.velY = 0;
					//}
				//}				
			//}
			for (i = 0; i < l; i++) {
				
				e1 = _entities[i];					
				// floor collision
				if (e1.position.z <= 0) {					
					e1.position.z = 0;
					e1.motion.velZ = 0;
					e1.motion.onGround = true;					
				}
			}
			
		}
		public function addEntity(entity:Entity):void {
			
			removeEntity(entity);
			
			if (!entity.position || !entity.motion || !entity.collision) return;
			
			_entities.push(entity);
			
		}
		public function removeEntity(entity:Entity):void {
			
			if (_entities.indexOf(entity) != -1) {
				_entities.splice(_entities.indexOf(entity), 1);
			}
			
		}	
	}
}