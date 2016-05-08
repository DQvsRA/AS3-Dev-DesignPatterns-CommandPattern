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
	public class MoveAsyncCommand extends AsyncCommand implements ICommand 
	{
		private var _unit:Unit;
		private var _xPos:uint;
		private var _yPos:uint;
		
		public function MoveAsyncCommand(unit:Unit, xPos:uint, yPos:uint) 
		{
			this._yPos = yPos;
			this._xPos = xPos;
			this._unit = unit;
		}
		
		override public function execute():void
		{
			var moveTween:TweenMax = _unit.move(_xPos, _yPos);
				moveTween.addEventListener(Event.COMPLETE, onComplete);
		}
		
		private function onComplete(e:Event):void 
		{
			e.currentTarget.addEventListener(Event.COMPLETE, onComplete);
			complete();
		}
		
	}

}