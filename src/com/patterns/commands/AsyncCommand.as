package com.patterns.commands 
{
	import com.patterns.Interfaces.IAsyncCommand;
	
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	public class AsyncCommand implements IAsyncCommand 
	{
		private var callback:Function;
		
		public function AsyncCommand() 
		{
			
		}
		
		/* INTERFACE com.patterns.Interfaces.IAsyncCommand */
		
		public function addCompleteCallback(callback:Function):void 
		{
			this.callback = callback;
		}
		
		public function execute():void 
		{
			
		}
		
		public function complete():void
		{
			callback.call();
		}
		
	}

}