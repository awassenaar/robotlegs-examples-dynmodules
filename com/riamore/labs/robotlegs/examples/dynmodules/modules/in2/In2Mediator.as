package com.riamore.labs.robotlegs.examples.dynmodules.modules.in2
{
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	import com.riamore.labs.robotlegs.examples.dynmodules.common.events.InputFormEvent;
	import com.riamore.labs.robotlegs.examples.dynmodules.common.model.DataModel;
	
	 /**
	 * In2Mediator sets form inputs according to the current values in the DataModel each time Module In2
	 * is loaded. It also listens to events dispatched by the view (here: InputFormEvent) and redispatches
	 * these events by using the Eventmap.mapListener method.
	 *
	 * @internal Any portion of the DynModules example may be reused for any purpose where not licensed by another party restricting
	 * such use. Please leave the credits intact.	
	 * 
	 * @internal Loosely based on Joel Hooks modular Robotlegs application "Modular Doodads"
	 *
	 * @author Arjen Wassenaar   RIAmore.com  demo: http://labs.riamore.com/content/robotlegs/examples/dynmodules
	 * 
	 */
	public class In2Mediator extends ModuleMediator
	{
		[Inject]
		public var view:In2;
		
		[Inject]
		public var model:DataModel;
		
		//onregister gets called after the flex view component dispatches creationComplete
		override public function onRegister():void
		{
			eventMap.mapListener(view, InputFormEvent.CHANGE, dispatchToModules);
			
			view.inputOrange.text = model.dataList.getItemAt(0).value;
			view.inputGreen.text = model.dataList.getItemAt(1).value;
			view.inputBlue.text = model.dataList.getItemAt(2).value;
			
		}
		
		
		
	}
}