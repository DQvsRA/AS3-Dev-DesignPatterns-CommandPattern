package 
{
	import com.constants.Constants;
	import com.patterns.commands.AttackAsyncCommand;
	import com.patterns.commands.AttackCommand;
	import com.patterns.commands.CommandList;
	import com.patterns.commands.GatherAsyncCommand;
	import com.patterns.commands.GatherCommand;
	import com.patterns.commands.MoveAsyncCommand;
	import com.patterns.commands.MoveCommand;
	import com.patterns.commands.Unit;
	import flash.events.TimerEvent;
	
	import com.patterns.Interfaces.ICommand;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.SetIntervalTimer;
	import flash.utils.Timer;
	
	
	/**
	 * ...
	 * @author Vladimir Minkin
	 * @serialData 11/03/2011
	 * 
	 */
		
	import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
	 
	[SWF(backgroundColor="0xededed", frameRate="30")]
	public class CommandPattern extends Sprite 
	{
		private var unit:Unit;
		private var commandList:Array;
		private var timer:Timer;
		private var commandListClass:CommandList;
	
		public function CommandPattern():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		
			unit = new Unit();
			addChild(unit);
			
			commandList = new Array();
			commandListClass = new CommandList();
					
			stage.addEventListener(MouseEvent.CLICK, onClick);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			timer = new Timer(Constants.EXECUTE_TIME);
			timer.addEventListener(TimerEvent.TIMER, executeCommand);
			timer.start();
		}
		
		private function executeCommand(e:TimerEvent):void 
		{
			if (commandList.length > 0) 
			{
				var command:ICommand = commandList.shift() as ICommand
				command.execute();
			}
		}
		
		private function onClick(event:MouseEvent):void
        {
			var moveCommand:MoveCommand = new MoveCommand(unit, event.stageX, event.stageY);
				if (event.shiftKey)
				{
					commandList.push(moveCommand);
				}
				else if (event.ctrlKey)
				{
					commandListClass.add(new MoveAsyncCommand(unit, event.stageX, event.stageY));
				}
				else
				{
					commandList = [];
					moveCommand.execute();
				}
        }


        private function onKeyUp(event:KeyboardEvent):void
        {
			switch (event.keyCode)
            {
                case 49://keyboard 1
					var attackCommand:AttackCommand = new AttackCommand(unit);
						if (event.shiftKey)
						{
							commandList.push(attackCommand)
						}
						else if (event.ctrlKey)
						{
							commandListClass.add(new AttackAsyncCommand(unit));
						}
						else
						{
							commandList = [];
							attackCommand.execute();
						}
					break;

                case 50://keyboard 2
					var gatherCommand:GatherCommand = new GatherCommand(unit);
						if (event.shiftKey)
						{
							commandList.push(gatherCommand);
						}
						else if (event.ctrlKey)
						{
							commandListClass.add(new GatherAsyncCommand(unit));
						}
						else
						{
							commandList = [];
							gatherCommand.execute();
						}
                    break;
            }
        }
	}
}