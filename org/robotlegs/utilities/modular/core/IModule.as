/*
* Copyright (c) 2009 the original author or authors
*
* Permission is hereby granted to use, modify, and distribute this file
* in accordance with the terms of the license agreement accompanying it.
*/
package org.robotlegs.utilities.modular.core
{
    import org.robotlegs.core.IInjector;

    public interface IModule
    {
        /**
         * Use this setter to provide the module with an injector.
         * This setter should initiate the context of the module
         * via a ModuleContext that accepts the injector through its
         * constructor. The ModuleContext will create a child injector. 
         * @param value
         * 
         */        
        function set parentInjector(value:IInjector):void;
        
        /**
         * Modules need a method for cleanup and removal of the module from 
         * memory to make them available for garbage collection. 
         * 
         */        
        function dispose():void;
    }
}