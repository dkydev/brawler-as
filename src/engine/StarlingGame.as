package engine {
	
	import dragonBones.animation.WorldClock;
	import engine.entity.Entity;
	import engine.system.ISystem;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	public class StarlingGame extends Sprite implements ISystem {
		
		private var _entities:Vector.<Entity>;
		private var _backgroundContainer:Sprite;
		private var _shadowContainer:Sprite;
		private var _entityContainer:Sprite;
		private var _foregroundContainer:Sprite;
		private var _menuContainer:Sprite;
		
		public function StarlingGame():void {
			
			_entities = new Vector.<Entity>();
			
			_backgroundContainer 	= new Sprite();
			_shadowContainer 		= new Sprite();
			_entityContainer 		= new Sprite();
			_foregroundContainer 	= new Sprite();
			_menuContainer 			= new Sprite();
			
			scaleX = scaleY = 0.5;
			
			addChild(_backgroundContainer);
			addChild(_shadowContainer);
			addChild(_entityContainer);
			addChild(_foregroundContainer);
			addChild(_menuContainer);
			
		}
		/* INTERFACE engine.system.ISystem */
		public function update(levelManager:LevelManager):void {

			_entities.sort(depthSort);
			
			Console.clear();
			for each (var entity:Entity in _entities) {
				Console.log(entity, entity.position);
				entity.renderable.container.x = entity.position.x;
				entity.renderable.container.y = entity.position.z;
				entity.renderable.graphic.y = -entity.position.y;
				if (entity.renderable.shadow) {
					entity.renderable.shadow.x = entity.position.x;
					entity.renderable.shadow.y = entity.position.z;
				}
				entity.collision.hitboxImage.x = entity.position.x;
				entity.collision.hitboxImage.y = entity.position.z - entity.position.y;
				_entityContainer.addChild(entity.renderable.container);
			}
			
			//_entityContainer.sortChildren(depthSort); // TODO: sort more efficiently
			WorldClock.clock.advanceTime( -1);
			
		}
		public function addEntity(entity:Entity):void {
			
			removeEntity(entity);
			if (!entity.position || !entity.renderable) return;
			_entities.push(entity);
			_entityContainer.addChild(entity.renderable.container);
			if (entity.renderable.shadow)
				_shadowContainer.addChild(entity.renderable.shadow);			
			//_foregroundContainer.addChild(entity.collision.hitboxImage);
			
			WorldClock.clock.add(entity.renderable.armature);
			
		}
		public function removeEntity(entity:Entity):void {
			
			if (_entities.indexOf(entity) != -1) {
				_entities.splice(_entities.indexOf(entity), 1);
				_entityContainer.removeChild(entity.renderable.container);
				_shadowContainer.removeChild(entity.renderable.shadow);				
				_foregroundContainer.removeChild(entity.collision.hitboxImage);
				
				WorldClock.clock.remove(entity.renderable.armature);
			}
			
		}
		private function depthSort(a:Entity, b:Entity):int {
			
			var ad:Number = a.position.z - (a.position.y + a.position.height);
			var bd:Number = b.position.z - (b.position.y + b.position.height);
			
			if (ad > bd) { // && a.position.y > b.position.y + b.position.height) {
				return 1;
			} else if (ad < bd) {// || a.position.y < b.position.y + b.position.height) {
				return -1;
			}
			return  0;
			
		}
		public function get entityContainer():Sprite {
			return _entityContainer;
		}
		public function get backgroundContainer():Sprite {
			return _backgroundContainer;
		}
	}
}