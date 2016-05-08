package com.patterns.commands 
{
	import com.greensock.TweenMax;
	import flash.events.Event;
	
	import com.patterns.commands.Unit;
	import com.patterns.Interfaces.ICommand;
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	public class GatherAsyncCommand extends AsyncCommand implements ICommand 
	{
		private var _unit:Unit;
		
		public function GatherAsyncCommand(unit:Unit) 
		{
			this._unit = unit;
		}
		
		override public function execute():void
		{
			var gatherTween:TweenMax = _unit.gather();
				gatherTween.addEventListener(Event.COMPLETE, onComplete);
		}
		
		private function onComplete(e:Event):void 
		{
			e.currentTarget.removeEventListener(Event.COMPLETE, onComplete);
			complete();
		}
		
	}

}