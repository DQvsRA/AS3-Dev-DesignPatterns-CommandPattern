package com.patterns.commands 
{
	import com.patterns.Interfaces.ICommand;
	
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	public class MoveCommand implements ICommand
	{
		public var targetY:Number;
		public var _unit:Unit;
		public var targetX:Number;
		
		public function MoveCommand(unit:Unit, targetX:Number, targetY:Number) 
		{
			this._unit = unit;
			this.targetX = targetX;
			this.targetY = targetY;
		}
		
		public function execute():void
		{
			_unit.move(targetX, targetY);
		}
	}
}