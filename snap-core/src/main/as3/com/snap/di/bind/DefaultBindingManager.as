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

    import flash.utils.Dictionary;


    /**
     * This class represents the default implementation of the binding manager. The binding manager simply tracks and
     * manages all relationships defined by the developer.
     *
     * @author Matt Bolt, mbolt35&#64;gmail.com
     */
    public class DefaultBindingManager implements IBindingManager {

        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         * the backing dictionary for the class mapping
         */
        private var _mappings:Dictionary = new Dictionary();


        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * Creates a new <code>DefaultBindingManager</code> instance.
         */
        public function DefaultBindingManager() {

        }


        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------

        /**
         * @inheritDoc
         */
        public function add(base:Class, bindedTo:Class):void {
            // TODO: Allow multiple bindings as long as they are annotated -- continue to use map, but add buckets.
            if (_mappings[base]) {
                throw new Error("Class: " + base + " has already been mapped to: " + _mappings[base]);
            }

            _mappings[base] = bindedTo;
        }
    }
}
