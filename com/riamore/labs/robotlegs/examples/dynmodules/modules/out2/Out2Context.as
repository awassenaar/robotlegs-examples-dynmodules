package com.riamore.labs.robotlegs.examples.dynmodules.modules.out2
{
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	import org.robotlegs.base.ContextEvent;
	
	/**
	 * Out2Context maps the view of module Out2 to its mediator when the module is loaded. 
	 *  
	 * @internal Any portion of the DynModules example may be reused for any purpose where not licensed by another party restricting
	 * such use. Please leave the credits intact.	
	 * 
	 * @internal Loosely based on Joel Hooks modular Robotlegs application "Modular Doodads"
	 *
	 * @author Arjen Wassenaar   RIAmore.com  demo: http://labs.riamore.com/content/robotlegs/examples/dynmodules
	 * 
	 */
	public class Out2Context extends ModuleContext
	{
		public function Out2Context(contextView:DisplayObjectContainer,  injector:IInjector)
		{
			super(contextView, true, injector);
		}
		
		override public function startup():void
		{
			// Module Mapping
			mediatorMap.mapView( Out2, Out2Mediator );
			super.startup();
		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
	}
}