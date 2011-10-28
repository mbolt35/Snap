////////////////////////////////////////////////////////////////////////////////
//
//  MATTBOLT.BLOGSPOT.COM
//  Copyright(C) 2011 Matt Bolt
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at:
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////

package com.snap.di.bind {


    /**
     * This class represents the default implementation of the binding factory. It creates new binding instances for
     * mapping implementation classes back to their base class.
     *
     * @author Matt Bolt, mbolt35&#64;gmail.com
     */
    public class DefaultBindingFactory implements IBinderFactory {

        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         * the binding manager implementation
         */
        private var _manager:IBindingManager;


        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * Creates a new <code>DefaultBindingFactory</code> instance.
         */
        public function DefaultBindingFactory(manager:IBindingManager) {
            _manager = manager;
        }


        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------

        /**
         * @iheritDoc
         */
        public function bindingFor(base:Class):IBinder {
            return new DefaultBinder(base, _manager);
        }
        
    }
}
