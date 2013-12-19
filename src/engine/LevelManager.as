package engine {
	
	import engine.entity.Entity;
	import engine.entity.Player;
	import engine.StarlingGame;
	import engine.system.ActionSystem;
	import engine.system.CollisionSystem;
	import engine.system.ISystem;
	import engine.system.MotionSystem;
	import starling.core.Starling;
	
	public class LevelManager {
		
		private var _entities:Vector.<Entity>;
		private var _systems:Vector.<ISystem>;
		
		private var _actionSystem:ActionSystem;
		private var _motionSystem:MotionSystem;
		private var _collisionSystem:CollisionSystem;		
		private var _starlingGame:StarlingGame;
		
		public function LevelManager():void {
			
			_entities = new Vector.<Entity>();
			_systems = new Vector.<ISystem>();
			
			_actionSystem = new ActionSystem();
			_motionSystem = new MotionSystem();
			_collisionSystem = new CollisionSystem();
			_starlingGame = Starling.current.root as StarlingGame;
			
			_systems.push(_actionSystem);
			_systems.push(_collisionSystem);
			_systems.push(_motionSystem);
			_systems.push(_starlingGame);
			
		}
		public function update():void {
			
			for each (var system:ISystem in _systems) {
				system.update(this);
			}
			
			Console.clear();
			for each (var entity:Entity in _entities) {
				Console.log(entity, entity.position);
			}
			
		}
		public function loadLevel(string:String):void {
			
			for (var i:int = 0; i < 2; i++) {
				addEntity(new Player(i, 150 * i + 200, 400, 0));
			}
			//for (var j:int = 0; j < 30; j++) {
				//addEntity(new Crate(Math.random()*500+200, Math.random()*400 + 200, Math.random()*600 + 100));
			//}
			
		}
		public function addEntity(entity:Entity):void {
			
			removeEntity(entity);
			
			_entities.push(entity);
			for each (var system:ISystem in _systems) {
				system.addEntity(entity);
			}
			
		}
		public function removeEntity(entity:Entity):void {
			
			if (_entities.indexOf(entity) != -1) {
				_entities.splice(_entities.indexOf(entity), 1);
				for each (var system:ISystem in _systems) {
					system.removeEntity(entity);
				}
			}
			
		}
		public function get starlingGame():StarlingGame {
			return _starlingGame;
		}		
		public function get collisionSystem():CollisionSystem {
			return _collisionSystem;
		}		
		public function get motionSystem():MotionSystem {
			return _motionSystem;
		}
		public function get actionSystem():ActionSystem {
			return _actionSystem;
		}		
		public function get entities():Vector.<Entity> {
			return _entities;
		}
	}
}