package com.patterns.Interfaces 
{
	
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	public interface IAsyncCommand 
	{
		function addCompleteCallback(callback:Function):void;
		function execute():void;
	}
	
}