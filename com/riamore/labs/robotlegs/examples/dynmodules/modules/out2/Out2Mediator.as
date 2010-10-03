package com.riamore.labs.robotlegs.examples.dynmodules.modules.out2
{
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	import com.riamore.labs.robotlegs.examples.dynmodules.common.model.DataModel;

	/**
	 * Out2Mediator sets the bar chart according to the current values in the DataModel 
	 * by injecting the data from the DataModel into the dataProvider of the bar chart
	 *  
	 * @internal Any portion of the DynModules example may be reused for any purpose where not licensed by another party restricting
	 * such use. Please leave the credits intact.	
	 * 
	 * @internal Loosely based on Joel Hooks modular Robotlegs application "Modular Doodads"
	 *
	 * @author Arjen Wassenaar   RIAmore.com  demo: http://labs.riamore.com/content/robotlegs/examples/dynmodules
	 * 
	 */
	public class Out2Mediator extends ModuleMediator
	{
		[Inject]
		public var view:Out2;
		
		[Inject]
		public var model:DataModel;
		
		
		override public function onRegister():void
		{
			view.columnChart.dataProvider= model.dataList;
		}	
		
	}
}