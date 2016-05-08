package com.patterns.commands 
{
	import com.patterns.Interfaces.ICommand;
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	public class GatherCommand implements ICommand
	{
		public var _unit:Unit;
		
		public function GatherCommand(unit:Unit) 
		{
			this._unit = unit;
		}
		
		public function execute():void
		{
			_unit.gather();
		}
	}
}