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
     * This class represents a method within a class. It contains data concerning the parameters and return type.
     *
     * @author Matt Bolt, mbolt35&#64;gmail.com
     */
    public class MethodNode {

        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         * the name of the method
         */
        private var _name:String;

        /**
         * @private
         * a list of the parameters for this method
         */
        private var _parameters:Vector.<ParameterNode>;

        /**
         * @private
         * the fully qualified return type
         */
        private var _returnType:String;


        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * Creates a new <code>MethodNode</code> instance.
         */
        public function MethodNode(name:String, parameters:Vector.<ParameterNode>, returnType:String) {
            _name = name;
            _parameters = parameters;
            _returnType = returnType;
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
            return "[MethodNode - name: " + _name + ", returnType: " + _returnType + ", params: " + _parameters + "]";
        }


        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------

        /**
         * This property contains the name of the method.
         */
        public function get name():String {
            return _name;
        }

        /**
         * This property contains a copy of the parameters this method accepts.
         */
        public function get parameters():Vector.<ParameterNode> {
            return _parameters.concat();
        }

        /**
         * This property contains the fully qualified class name of the return type.
         */
        public function get returnType():String {
            return _returnType;
        }
    }
}
