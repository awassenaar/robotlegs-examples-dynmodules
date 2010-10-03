package com.riamore.labs.robotlegs.examples.dynmodules.common.controller 
{
	
	import com.riamore.labs.robotlegs.examples.dynmodules.common.model.DataModel;
	import com.riamore.labs.robotlegs.examples.dynmodules.common.events.InputFormEvent;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	/**
	 * The InputFormCommand is triggered by the InputFormEvent. By injecting both InputFormEvent and
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
	public class InputFormCommand extends ModuleCommand
	{
		[Inject]
		public var event:InputFormEvent;
		
		[Inject]
		public var model:DataModel;
		
		override public function execute():void
		{
			model.updateList(event.colorValues);
		
		}
	}
}