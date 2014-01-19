package engine.system.collision {
	
	import dragonBones.animation.WorldClock;
	import engine.component.collision.CollisionComponent;
	import engine.component.collision.Hitbox;
	import engine.entity.Block;
	import engine.entity.Entity;
	import engine.LevelManager;
	import engine.system.ISystem;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import flash.utils.getQualifiedClassName;
	import starling.display.Image;
	
	public class CollisionSystem implements ISystem {
		
		private var _entities:Vector.<Entity>;
		private var _blocks:Vector.<Entity>;
		
		private var _events:Vector.<CollisionEvent>;
		
		//private var _hitboxes:Vector.<Hitbox>;
		
		private const faces:Vector.<Vector3D> = new <Vector3D>[
			new Vector3D(-1,  0,  0),
			new Vector3D( 1,  0,  0),
			new Vector3D( 0, -1,  0),
			new Vector3D( 0,  1,  0),
			new Vector3D( 0,  0, -1),
			new Vector3D( 0,  0,  1),
		];		
		
		public function CollisionSystem():void {
			
			_entities = new Vector.<Entity>();
			_blocks = new Vector.<Entity>();
			
			//_events = new Vector.<CollisionEvent>();
			
		}		
		/* INTERFACE engine.system.ISystem */		
		public function update(levelManager:LevelManager):void {
			
			var e1:Entity, e2:Entity;
			for each (e1 in _entities) {
				for each (e2 in _entities) {
					if (e1 == e2) continue;
					entityCollision(e1, e2);
				}
				for each (e2 in _blocks) {
					entityCollision(e1, e2);
				}
			}
			
		}
		private function entityCollision(e1:Entity, e2:Entity):void {
			
			var maxa:Vector3D = e1.collision.hitbox.max.add(e1.position.position);
			var mina:Vector3D = e1.collision.hitbox.min.add(e1.position.position);
			var maxb:Vector3D = e2.collision.hitbox.max.add(e2.position.position);
			var minb:Vector3D = e2.collision.hitbox.min.add(e2.position.position);
			
			var distances:Vector.<Number> = new <Number>[
				(maxb.x - mina.x),
				(maxa.x - minb.x),
				(maxb.y - mina.y),
				(maxa.y - minb.y),
				(maxb.z - mina.z),
				(maxa.z - minb.z)
			];
			
			var f:int;
			var distance:Number;
			for (var i:int = 0; i < 6; i++) {
				if (distances[i] < 0) return;
				if ((i == 0) || (distances[i] < distance)) {
					f = i;
					distance = distances[i];
				}
			}
			
			var normal:Vector3D = faces[f];
			
			resolveCollision(e1, e2, normal, distance);			
			
		}
		public function resolveCollision(e1:Entity, e2:Entity, normal:Vector3D, distance:Number):void {
			
			var mass_sum:Number = e1.motion.mass + e2.motion.mass;
			if (mass_sum == 0) return;			
			// fix overlapping...
			var c1:Vector3D = normal.clone();
			c1.scaleBy(-distance / (mass_sum));
			var c2:Vector3D = c1.clone();
			c1.scaleBy(e1.motion.mass);
			c2.scaleBy(e2.motion.mass);
			e1.position.position.incrementBy(c1);
			e2.position.position.decrementBy(c2);
			//
			
			if (normal.y == -1) {
				e1.motion.onGround = true;
			}
			
			// Calculate relative velocity
			var rv:Vector3D = e1.motion.velocity.subtract(e2.motion.velocity);
			// Calculate relative velocity in terms of the normal direction
			var velAlongNormal:Number = rv.dotProduct(normal);
			
			// Do not resolve if velocities are separating
			if (velAlongNormal < 0) return;
			 
			// Calculate restitution
			//float e = min( A.restitution, B.restitution)
			var e:Number = 0;
			  
			// Calculate impulse scalar
			var j:Number = -(1 + e) * velAlongNormal;
			j /= mass_sum;
			
			// Apply impulse
			var impulse1:Vector3D = normal.clone();
		    var impulse2:Vector3D = normal.clone();
			
			impulse1.scaleBy(j * e1.motion.mass);
			impulse2.scaleBy(j * e2.motion.mass);
			
			e1.motion.velocity.incrementBy(impulse1);
			e2.motion.velocity.decrementBy(impulse2);
			
		}
		public function addEntity(entity:Entity):void {
			
			removeEntity(entity);
			
			if (!entity.position || !entity.motion || !entity.collision) return;
			
			if (entity.collision.block) {
				_blocks.push(entity);
			} else {
				_entities.push(entity);
			}
		}
		public function removeEntity(entity:Entity):void {
			
			if (_entities.indexOf(entity) != -1) {
				_entities.splice(_entities.indexOf(entity), 1);
			}
			
		}	
	}
}