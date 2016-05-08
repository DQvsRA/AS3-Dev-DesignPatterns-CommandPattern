package com.patterns.commands
{
	import com.constants.Constants;
    import com.greensock.TweenMax;
    import flash.display.Sprite;

    public class Unit extends Sprite
    {
        public function Unit()
        {
            graphics.beginFill(0x0000cc);
            graphics.drawRect(-15, -15, 30, 30);
            graphics.endFill();
        }
		
		public function attack():TweenMax
        {
			var duration:Number = Constants.EXECUTE_TIME / 1000;
            var attackTween:TweenMax = TweenMax.to(this, duration, 
					{
						bezierThrough:[ { rotation:180 } ], 
						rotation:0, 
						onComplete:ClearTween(this)
					});
            return attackTween;
        }

        public function gather():TweenMax
        {
			var duration:Number = Constants.EXECUTE_TIME / 1000;
            var gatherTween:TweenMax = TweenMax.to(this, duration, 
					{
						bezierThrough:[ { scaleX:2, scaleY:2 } ], 
						scaleX:1, 
						scaleY:1, 
						onComplete:ClearTween(this)
					});
            return gatherTween;
        }

        public function move(targetX:Number, targetY:Number):TweenMax
        {
			var duration:Number = Constants.EXECUTE_TIME / 1000;
            var moveTween:TweenMax = TweenMax.to(this, duration, 
					{
						x:targetX, 
						y:targetY, 
						onComplete:ClearTween(this)
					});
            return moveTween;
        }
		
		private function ClearTween(obj:*):void
		{
			TweenMax.killTweensOf(obj, false);
		}
    }
}