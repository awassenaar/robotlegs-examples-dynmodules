/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package org.robotlegs.utilities.modular.mvcs
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	
	import org.robotlegs.adapters.SwiftSuspendersInjector;
	import org.robotlegs.base.CommandMap;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.base.MediatorMap;
	import org.robotlegs.core.ICommandMap;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.core.IMediatorMap;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.modular.base.ModuleCommandMap;
	import org.robotlegs.utilities.modular.base.ModuleEventDispatcher;
	import org.robotlegs.utilities.modular.core.IModuleCommandMap;
	import org.robotlegs.utilities.modular.core.IModuleContext;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;

    /**
     * Contains additional mappings and facilitates the use of a parent injector
     * to create a child injector for a module. 
     * @author Joel Hooks
     * 
     */    
    public class ModuleContext extends Context implements IModuleContext
    {
        protected var _applicationDomain:ApplicationDomain;
        
        protected var _moduleDispatcher:IModuleEventDispatcher;

        protected function get moduleDispatcher():IModuleEventDispatcher
        {
            return _moduleDispatcher;
        }

        protected function set moduleDispatcher(value:IModuleEventDispatcher):void
        {
            _moduleDispatcher = value;
        }
        
        protected var _moduleCommandMap:IModuleCommandMap;

        protected function get moduleCommandMap():IModuleCommandMap
        {
            return _moduleCommandMap || (_moduleCommandMap = new ModuleCommandMap(moduleDispatcher, injector.createChild(_applicationDomain), reflector));
        }
        
        protected function set moduleCommandMap(value:IModuleCommandMap):void
        {
            _moduleCommandMap = value;
        }
  
        /**
         * The <code>ICommandMap</code> for this <code>IContext</code>
         */
        override protected function get commandMap():ICommandMap
        {
            return _commandMap || (_commandMap = new CommandMap(eventDispatcher, injector.createChild(_applicationDomain), reflector));
        }

   		/**
		 * @private
		 */
		override protected function set commandMap(value:ICommandMap):void
		{
			_commandMap = value;
		}

		/**
		 * @private
		 */
		override protected function set mediatorMap(value:IMediatorMap):void
		{
			_mediatorMap = value;
		}
        /**
         * The <code>IMediatorMap</code> for this <code>IContext</code>
         */
        override protected function get mediatorMap():IMediatorMap
        {
            return _mediatorMap || (_mediatorMap = new MediatorMap(contextView, injector.createChild(_applicationDomain), reflector));
        }
        
        public function ModuleContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true, parentInjector:IInjector = null, applicationDomain:ApplicationDomain = null)
        {
            _applicationDomain = applicationDomain || ApplicationDomain.currentDomain;
            if(parentInjector)
            {
                _injector = parentInjector.createChild(_applicationDomain);
            }
            super(contextView, autoStartup);
        }
        
        override protected function mapInjections():void
        {
            super.mapInjections();
            initializeModuleEventDispatcher();
            injector.mapValue(IModuleCommandMap, moduleCommandMap);
        }
        
        protected function initializeModuleEventDispatcher():void
        {
            if(injector.hasMapping(IModuleEventDispatcher) )
            {
                moduleDispatcher = injector.getInstance(IModuleEventDispatcher);
            }
            else
            {
                moduleDispatcher = new ModuleEventDispatcher(this);
                injector.mapValue(IModuleEventDispatcher, moduleDispatcher); 
            }          
        }
        
        protected function dispatchToModules(event:Event):Boolean
        {
            if(moduleDispatcher.hasEventListener(event.type))
                return moduleDispatcher.dispatchEvent(event);
            return true;
        }
        
        public function dispose():void
        {
            dispatchEvent(new ContextEvent(ContextEvent.SHUTDOWN));
            _commandMap.unmapEvents();
            _moduleCommandMap.unmapEvents();
            _moduleCommandMap = null;
            _moduleDispatcher = null;
            _contextView = null;
            _injector = null;
            _reflector = null;
            _commandMap = null;
            _mediatorMap = null;
            _viewMap = null;
            _eventDispatcher = null;
            _applicationDomain = null;
        }
    }
}