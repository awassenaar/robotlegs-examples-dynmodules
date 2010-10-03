package com.riamore.labs.robotlegs.examples.dynmodules
{
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	
	import com.riamore.labs.robotlegs.examples.dynmodules.interfaces.IIn1;
	import com.riamore.labs.robotlegs.examples.dynmodules.interfaces.IIn2;
	import com.riamore.labs.robotlegs.examples.dynmodules.interfaces.IOut1;
	import com.riamore.labs.robotlegs.examples.dynmodules.interfaces.IOut2;
	
	import com.riamore.labs.robotlegs.examples.dynmodules.common.model.DataModel;
	import com.riamore.labs.robotlegs.examples.dynmodules.common.controller.InputSliderCommand;
	import com.riamore.labs.robotlegs.examples.dynmodules.common.events.InputSliderEvent;
	import com.riamore.labs.robotlegs.examples.dynmodules.common.controller.InputFormCommand;
	import com.riamore.labs.robotlegs.examples.dynmodules.common.events.InputFormEvent;
	
	/**
	 * At application startup DynModulesContext maps the module interfaces for automatic injection.
	 * It also maps the datamodel and custom events used in this application 
	 *
	 * @internal Any portion of the DynModules example may be reused for any purpose where not licensed by another party restricting
	 * such use. Please leave the credits intact.	
	 * 
	 * @internal Loosely based on Joel Hooks modular Robotlegs application "Modular Doodads"
	 *
	 * @author Arjen Wassenaar   RIAmore.com  demo: http://labs.riamore.com/content/robotlegs/examples/dynmodules
	 * 
	 */
	public class DynModulesContext extends ModuleContext
	{

		override public function startup():void
		{
			
	  		//map commands that can be triggered by events dispatched on the shared ModuleEventDispatcher
			moduleCommandMap.mapEvent(InputSliderEvent.CHANGE , InputSliderCommand, InputSliderEvent);
			moduleCommandMap.mapEvent(InputFormEvent.CHANGE , InputFormCommand, InputFormEvent);
			
			//map model
			injector.mapSingleton(DataModel);
			
			//the module interfaces are mapped for automatic injection
			viewMap.mapType( IIn1);
			viewMap.mapType( IIn2);
			viewMap.mapType( IOut1);
			viewMap.mapType( IOut2);
			
			super.startup();

		}
	}
}