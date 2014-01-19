package engine.component {
	
	import engine.entity.Entity;
	import engine.LevelManager;
	import flash.geom.Vector3D;
	
	public class MotionComponent implements IComponent {
		
		public var speed:Vector3D;
		public var velocity:Vector3D;
		
		public var mass:Number;
		
		public var gravity:Number = -2;
		public var friction:Number = 0.4;
		
		public var fixed:Boolean;
		public var onGround:Boolean = false;
		
		public function MotionComponent(speedX:Number, speedY:Number, speedZ:Number, mass:Number = 1, fixed:Boolean = false):void {
			
			this.speed = new Vector3D(speedX, speedY, speedZ);
			this.velocity = new Vector3D(0, 0, 0);			
			
			this.mass = mass;
			
			this.fixed = fixed;
			
		}		
	}
}