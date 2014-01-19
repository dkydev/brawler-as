package engine.component.action {
	
	import engine.entity.Entity;
	import engine.LevelManager;
	import engine.component.action.ActionComponent;
	import engine.component.IComponent;
	
	public class PlayerAction extends ActionComponent implements IComponent {
		
		public var left:int = 0;
		public var right:int = 0;
		public var up:int = 0;
		public var down:int = 0;
		public var punch:int = 0;
		public var jump:int = 0;
		
		public function PlayerAction():void {
			
		}
		public override function update(levelManager:LevelManager, entity:Entity):void {
			
			if (punch || entity.renderable.armature.animation.lastAnimationState.name == "punch") {				
				if (entity.renderable.armature.animation.isComplete) {
					punch = 0;					
				} else {
					entity.motion.velocity.x = -entity.renderable.graphic.scaleX * 15;
					entity.motion.velocity.y = 0;
					entity.renderable.playAnimation("punch");
					return;
				}				
			}
			
			entity.motion.velocity.x = (right - left) * entity.motion.speed.x;
			entity.motion.velocity.z = (down - up) * entity.motion.speed.z;
			if (left && !right) {
				entity.renderable.graphic.scaleX = 1;
			}
			if (right && !left) {
				entity.renderable.graphic.scaleX = -1;
			}
			if (jump == 1) {
				jump = 0;
				if (entity.motion.onGround) {
					entity.motion.velocity.y = entity.motion.speed.y;
				}
			}
			if (entity.motion.onGround) {
				if ((left || right || up || down) && (entity.motion.velocity.x != 0 || entity.motion.velocity.z != 0)) {
					entity.renderable.playAnimation("run");
				} else {
					entity.renderable.playAnimation("idle");
				}
			} else {
				if (entity.motion.velocity.y > 0) {
					entity.renderable.playAnimation("jump");
				} else {						
					entity.renderable.playAnimation("fall");
				}				
			}
			
		}
	}
}