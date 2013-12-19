package engine.entity {
	
	import dragonBones.animation.WorldClock;
	import engine.component.ActionComponent;
	import engine.component.CollisionComponent;
	import engine.component.Hitbox;
	import engine.component.InputComponent;
	import engine.component.MotionComponent;
	import engine.component.action.PlayerAction;
	import engine.component.sprite.PlayerSprite;
	import engine.component.PositionComponent;
	import engine.component.SpriteComponent;
	import engine.LevelManager;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Player extends Entity {
		
		public function Player(playerNumber:uint, x:Number, y:Number, z:Number):void {
			
			super("player" + playerNumber);
			
			input 		= new InputComponent(this);
			action		= new PlayerAction();
			motion 		= new MotionComponent(8, 8, 40);
			position 	= new PositionComponent(x, y, z, 80, 40, 160);
			collision   = new CollisionComponent(new Hitbox(x, y, z, 80, 40, 160));
			sprite 		= new PlayerSprite();
			
		}
	}
}