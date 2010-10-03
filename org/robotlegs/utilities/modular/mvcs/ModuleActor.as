package org.robotlegs.utilities.modular.mvcs
{
    import flash.events.Event;
    
    import org.robotlegs.mvcs.Actor;
    import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;

    public class ModuleActor extends Actor
    {
        /**
         * @private
         */
        protected var _moduleEventDispatcher:IModuleEventDispatcher;
        
        //---------------------------------------------------------------------
        //  Constructor
        //---------------------------------------------------------------------
        
        public function ModuleActor()
        {
        }
        
        //---------------------------------------------------------------------
        //  API
        //---------------------------------------------------------------------
        
        /**
         * @inheritDoc
         */
        public function get moduleEventDispatcher():IModuleEventDispatcher
        {
            return _moduleEventDispatcher;
        }
        
        [Inject]
        /**
         * @private
         */
        public function set moduleEventDispatcher(value:IModuleEventDispatcher):void
        {
            _moduleEventDispatcher = value;
        }
        
        protected function dispatchToModules(event:Event):Boolean
        {
            if(moduleEventDispatcher.hasEventListener(event.type))
               return moduleEventDispatcher.dispatchEvent(event);
            return true;
        }
    }
}