package com.patterns.commands 
{
	import com.patterns.Interfaces.ICommand;
	
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	public class AttackCommand implements ICommand
	{
		private var _unit:Unit;
		
		public function AttackCommand(unit:Unit) 
		{
			this._unit = unit;
		}
		
		public function execute():void
		{
			_unit.attack();
		}
	}
}