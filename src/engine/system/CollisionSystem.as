package engine.system {
	
	import Box2D.Collision.b2AABB;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Common.Math.b2Vec3;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	import dragonBones.animation.WorldClock;
	import engine.component.CollisionComponent;
	import engine.entity.Entity;
	import engine.LevelManager;
	import starling.display.Image;
	
	public class CollisionSystem implements ISystem {
		
		private var _entities:Vector.<Entity>;
		
		private var _gravity:b2Vec2;
		private var _world:b2World;
		
		public var ground:CollisionComponent;
		
		public function CollisionSystem():void {
			
			_gravity = new b2Vec2(0, 2);
			_world = new b2World(_gravity, true);
			
			_entities = new Vector.<Entity>();
			
			ground = new CollisionComponent(0, 0, 0, 600, 20, 600, true);
			ground.body = _world.CreateBody(ground.bodyDef);
			ground.fixture = ground.body.CreateFixture(ground.fixtureDef);
			
			//_groundBodyDef = new b2BodyDef();
			//_groundBodyDef.position.Set(0, 0);
			//_groundBody = _world.CreateBody(_groundBodyDef);
			//_groundFixtureDef = new b2FixtureDef();
			//
			//var groundShape:b2PolygonShape = new b2PolygonShape();
			//groundShape.SetAsBox(600, 20);
			//_groundFixtureDef.shape = groundShape;
			//
			//_groundFixture = _groundBody.CreateFixture(_groundFixtureDef);
			//
			//groundImage = new Image(Texture.fromColor(width, height, 0x64ff0064));
			
		}		
		/* INTERFACE engine.system.ISystem */		
		public function update(levelManager:LevelManager):void {
			
			var position:b2Vec2;
			var vel:b2Vec2;
			for each (var entity:Entity in _entities) {
				
				//newVel = entity.collision.body.GetLinearVelocity();
				//newVel.Add(new b2Vec2(entity.motion.velX, entity.motion.velZ));
				//entity.motion.velX = 0;
				//entity.motion.velY = 0;
				//entity.motion.velZ = 0;
				//vel = entity.collision.body.GetLinearVelocity();
				//vel.Add(new b2Vec2(entity.motion.velX, entity.motion.velZ));
				//entity.collision.body.SetLinearVelocity(vel);
				position = entity.collision.body.GetPosition();
				entity.position.x = position.x;
				entity.position.z = position.y;
				
			}
			_world.Step(1, 10, 10);
			
		}
		public function addEntity(entity:Entity):void {
			
			removeEntity(entity);
			
			if (!entity.position || !entity.motion || !entity.collision) return;
			
			_entities.push(entity);
			
			entity.collision.body = _world.CreateBody(entity.collision.bodyDef);
			entity.collision.fixture = entity.collision.body.CreateFixture(entity.collision.fixtureDef);
		}
		public function removeEntity(entity:Entity):void {
			
			if (_entities.indexOf(entity) != -1) {
				_entities.splice(_entities.indexOf(entity), 1);
				
				//TODO: remove body / fixture
			}
			
		}	
	}
}