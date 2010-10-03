package com.riamore.labs.robotlegs.examples.dynmodules.modules.out1
{
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	
	/**
	 * Out1Context maps the view of module Out1 to its mediator when the module is loaded. 
	 *  
	 * @internal Any portion of the DynModules example may be reused for any purpose where not licensed by another party restricting
	 * such use. Please leave the credits intact.	
	 * 
	 * @internal Loosely based on Joel Hooks modular Robotlegs application "Modular Doodads"
	 *
	 * @author Arjen Wassenaar   RIAmore.com  demo: http://labs.riamore.com/content/robotlegs/examples/dynmodules
	 * 
	 */
	public class Out1Context extends ModuleContext
	{
		public function Out1Context(contextView:DisplayObjectContainer,  injector:IInjector)
		{
			super(contextView, true, injector);
		}
		
		override public function startup():void
		{
			// Module Mapping
			mediatorMap.mapView( Out1, Out1Mediator );
			super.startup();
		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
	}
}