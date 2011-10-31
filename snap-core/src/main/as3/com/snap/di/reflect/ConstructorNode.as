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

    import com.snap.di.annotations.IAnnotation;


    /**
     * This class represents the constructor for a class. It contains parameter information as well as annotated data.
     * 
     * @author Matt Bolt, mbolt35&#64;gmail.com
     */
    public final class ConstructorNode {

        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         * the list of parameters required to pass to the constructor
         */
        private var _parameters:Vector.<ParameterNode>;

        /**
         * @private
         * the annotations attached to the constructor
         */
        private var _annotations:Vector.<IAnnotation>;


        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * Create a new <code>ConstructorNode</code> instance.
         */
        public function ConstructorNode(parameters:Vector.<ParameterNode>, annotations:Vector.<IAnnotation>) {
            _parameters = parameters;
            _annotations = annotations;
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
            return "[Constructor Node]";
        }


        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------

        /**
         * This property contains a copy of the <code>ParameterNode</code> instances used to pass the constructor.
         */
        public function get parameters():Vector.<ParameterNode> {
            return _parameters;
        }

        /**
         * This property contains a copy of the <code>IAnnotation</code> instances set on the constructor.
         */
        public function get annotations():Vector.<IAnnotation> {
            return _annotations;
        }
    }
}
