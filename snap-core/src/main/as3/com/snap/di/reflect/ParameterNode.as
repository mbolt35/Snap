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

package com.snap.di.reflect {
    

    /**
     * This class represents a parameter for a method or constructor.
     * 
     * @author Matt Bolt, mbolt35&#64;gmail.com
     */
    public final class ParameterNode {

        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         * the index of the parameter
         */
        private var _index:int;

        /**
         * @private
         * the type of the parameter
         */
        private var _type:String;

        /**
         * @private
         * whether or not the parameter is optional or not.
         */
        private var _optional:Boolean;


        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * Creates a new <code>ParameterNode</code> instance.
         * 
         * @param index The index of the parameter.
         *
         * @param type The type of the parameter.
         *
         * @param optional Whether or not the parameter is optional or not.
         */
        public function ParameterNode(index:int, type:String, optional:Boolean) {
            _index = index;
            _type = type;
            _optional = optional;
        }


        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------

        /**
         * @inheritDoc
         */
        public function toString():String {
            return "[ParameterNode - index: " + _index + ", type: " + _type + ", optional: " + _optional + "]";
        }


        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------

        /**
         * This property contains the index of the parameter.
         */
        public function get index():int {
            return _index;
        }

        /**
         * This property contains the fully qualified type of the parameter.
         */
        public function get type():String {
            return _type;
        }

        /**
         * This property is set to <code>true</code> if the parameter is optional.
         */
        public function get optional():Boolean {
            return _optional;
        }
    }
}
