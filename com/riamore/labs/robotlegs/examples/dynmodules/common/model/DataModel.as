package com.riamore.labs.robotlegs.examples.dynmodules.common.model 
{
	import com.riamore.labs.robotlegs.examples.dynmodules.common.model.vo.DataVO;
	import mx.collections.ArrayCollection;
	import org.robotlegs.utilities.modular.mvcs.ModuleActor;
	
	/**
	 * The Datamodel is the place where the input values for "orange", "green" and " blue" are stored.
	 *  
	 * @internal Any portion of the DynModules example may be reused for any purpose where not licensed by another party restricting
	 * such use. Please leave the credits intact.	
	 * 
	 * @internal Loosely based on Joel Hooks modular Robotlegs application "Modular Doodads"
	 *
	 * @author Arjen Wassenaar   RIAmore.com  demo: http://labs.riamore.com/content/robotlegs/examples/dynmodules
	 * 
	 */
	
	public class DataModel extends ModuleActor
	{
		private var _list:ArrayCollection;
		
		 
		public function DataModel() 
		{
			init();
		}
		
		/**
		 * init adds value objects to a list with initial values 2,4,6 for the colors "orange", "green" and " blue". 
		 * 
		 */
		private function init():void
		{
			_list = new ArrayCollection();
			
			var dataVO:DataVO = new DataVO();
			dataVO.color = "orange";
			dataVO.value = 2;
			_list.addItem(dataVO);
			dataVO = new DataVO();
			dataVO.color = "green";
			dataVO.value = 4;
			_list.addItem(dataVO);
			dataVO = new DataVO();
			dataVO.color = "blue";
			dataVO.value = 6;
			_list.addItem(dataVO);
		}
		
		/**
		 * get dataList returns the color-values as a list of Value Objects 
		 */
		public function get dataList():ArrayCollection
		{
			return _list;
		}
		

		/**
		 * updateListItem only updates the Value Object that has changed.
		 * 
		 * @param	newDataVO 
		 * A Value Object containing color and value of the changed input
		 */
		public function updateListItem(newDataVO:DataVO):void
		{
			for (var i:* in _list)
			{
				if(_list.getItemAt(i).color== newDataVO.color)
				{
					_list[i] = newDataVO;
					break;
				}
			}
			
		}
		
		/**
		 * updateList updates all value objects in the list
		 * 
		 * @param	newColorValues
		 * An array containing the color values in the order "orange", "green", "blue".
		 */
		public function updateList(newColorValues:Array):void
		{
			_list[0].value = newColorValues[0];
			_list[1].value = newColorValues[1];
			_list[2].value = newColorValues[2];
			_list.refresh();
		}
		
	}

}