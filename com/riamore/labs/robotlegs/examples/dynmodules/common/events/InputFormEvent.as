package com.riamore.labs.robotlegs.examples.dynmodules.common.events 
{
	import com.riamore.labs.robotlegs.examples.dynmodules.common.model.vo.DataVO;
	import flash.events.Event;
	
	/**
	 * 
	 * @internal Any portion of the DynModules example may be reused for any purpose where not licensed by another party restricting
	 * such use. Please leave the credits intact.	
	 * 
	 * @internal Loosely based on Joel Hooks modular Robotlegs application "Modular Doodads"
	 *
	 * @author Arjen Wassenaar   RIAmore.com  demo: http://labs.riamore.com/content/robotlegs/examples/dynmodules
	 * 
	 */
	public class InputFormEvent extends Event 
	{
		
		public static const CHANGE:String = "change";

		private var _colorValues:Array;
		
		
		public function get colorValues():Array
		{
			return _colorValues;
		}
		
		public function InputFormEvent(type:String, colorValues:Array, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			_colorValues = colorValues;

		} 
		
		public override function clone():Event 
		{ 
			return new InputFormEvent(type, colorValues, bubbles, cancelable);
		} 
		
	}
	
}