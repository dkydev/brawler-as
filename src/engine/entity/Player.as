package engine.entity {
	
	import engine.component.action.PlayerAction;
	import engine.component.CollisionComponent;
	import engine.component.InputComponent;
	import engine.component.MotionComponent;
	import engine.component.PositionComponent;
	import engine.component.render.PlayerRenderable;
	
	public class Player extends Entity {
		
		public function Player(playerNumber:uint, x:Number, y:Number, z:Number):void {
			
			super("player" + playerNumber);
			
			var width:Number = 80;
			var height:Number = 160;
			var depth:Number = 40;
			
			input 		= new InputComponent(this);
			action		= new PlayerAction();
			motion 		= new MotionComponent(8, 8, 40);
			position 	= new PositionComponent(x, y, z, width, height, depth);
			collision   = new CollisionComponent(0, 0, 0, width, height, depth);
			renderable	= new PlayerRenderable();
			
		}
	}
}