package engine.system.collision {
	
	import engine.component.MotionComponent;
	import engine.entity.Entity;
	
	public class CollisionEvent {
		
		public var entity1:Entity;
		public var entity2:Entity;
		
		public function CollisionEvent(entity1:Entity, entity2:Entity) {
			
			this.entity1 = entity1;
			this.entity2 = entity2;
			
		}		
	}
}