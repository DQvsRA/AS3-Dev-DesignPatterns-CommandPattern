package com.patterns.commands 
{
	import com.patterns.Interfaces.IAsyncCommand;
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	public class CommandList 
	{
		private var commands:Array = [];
		private var isBusy:Boolean = false;;
		
		public function add(command:IAsyncCommand):void
		{
			command.addCompleteCallback(executeNext);
			//Stackof a commands
			commands.push(command);
			
			attemptExecute();
		}
		
		private function attemptExecute():void
		{
			if (!isBusy) 
			{
				executeNext();
			}
		}
		
		private function executeNext():void
		{
			isBusy = false;
			if (commands.length > 0)
			{
				isBusy = true;
				
				var command:IAsyncCommand = commands.shift() as IAsyncCommand;
					command.execute();
			}
		}
	}

}