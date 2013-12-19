package engine.component {
	
	import engine.entity.Entity;
	import engine.LevelManager;
	
	public class MotionComponent implements IComponent {
		
		public var speedX:Number;
		public var speedY:Number;
		public var speedZ:Number;
		
		public var velX:Number = 0;
		public var velY:Number = 0;
		public var velZ:Number = 0;
		
		public var gravity:Number = -2;
		
		public var onGround:Boolean = false;
		
		public function MotionComponent(speedX:Number, speedY:Number, speedZ:Number):void {
			
			this.speedX = speedX;
			this.speedY = speedY;
			this.speedZ = speedZ;
			
		}
	}
}