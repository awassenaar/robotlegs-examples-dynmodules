package com.riamore.labs.robotlegs.examples.dynmodules.common.controller 
{
	
	import com.riamore.labs.robotlegs.examples.dynmodules.common.model.DataModel;
	import com.riamore.labs.robotlegs.examples.dynmodules.common.events.InputSliderEvent;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	/**
	 * The InputSliderCommand is triggered by the InputSliderEvent. By injecting both InputSliderEvent and
	 * DataModel, the model can be updated with the property of the event.
	 *  
	 * @internal Any portion of the DynModules example may be reused for any purpose where not licensed by another party restricting
	 * such use. Please leave the credits intact.	
	 * 
	 * @internal Loosely based on Joel Hooks modular Robotlegs application "Modular Doodads"
	 *
	 * @author Arjen Wassenaar   RIAmore.com  demo: http://labs.riamore.com/content/robotlegs/examples/dynmodules
	 * 
	 */
	public class InputSliderCommand extends ModuleCommand
	{
		[Inject]
		public var event:InputSliderEvent;
		
		[Inject]
		public var model:DataModel;
		
		override public function execute():void
		{
			model.updateListItem(event.dataVO);
		}
	}
}