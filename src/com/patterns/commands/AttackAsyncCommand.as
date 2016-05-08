package com.patterns.commands 
{
	import com.greensock.TweenMax;
	import com.patterns.Interfaces.ICommand;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	public class AttackAsyncCommand extends AsyncCommand implements ICommand 
	{
		private var _unit:Unit;
		
		public function AttackAsyncCommand(unit:Unit) 
		{
			this._unit = unit;
		}
		
		override public function execute():void
		{
			var attackTween:TweenMax = _unit.attack();
				attackTween.addEventListener(Event.COMPLETE, onComplete);
		}
		
		private function onComplete(e:Event):void 
		{
			e.currentTarget.removeEventListener(Event.COMPLETE, onComplete);
			complete();
		}
		
	}

}