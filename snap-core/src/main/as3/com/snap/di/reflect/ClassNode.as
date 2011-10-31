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
     * This class represents a "Class" object data. It's used to determine dependencies and injection points.
     *
     * @author Matt Bolt, mbolt35&#64;gmail.com
     */
    public final class ClassNode {

        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         * the name of the class
         */
        private var _name:String;

        /**
         * @private
         * the class constructor
         */
        private var _constructor:ConstructorNode;

        /**
         * @private
         * the fields/properties of the class
         */
        private var _fields:Vector.<FieldNode>;

        /**
         * @private
         * the methods of this class.
         */
        private var _methods:Vector.<MethodNode>;

        
        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * Creates a new <code>ClassNode</code> instance.
         */
        public function ClassNode( name:String,
                                   constructor:ConstructorNode,
                                   fields:Vector.<FieldNode>,
                                   methods:Vector.<MethodNode> )
        {
            _name = name;
            _constructor = constructor;
            _fields = fields;
            _methods = methods;
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
            return "[ClassNode]";
        }


        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------

        /**
         * This property contains the fully qualified class name.
         */
        public function get name():String {
            return _name;
        }

        /**
         * This property contains the <code>ConstructorNode</code>, which contains annotation and parameter data.
         */
        public function get constructor():ConstructorNode {
            return _constructor;
        }

        /**
         * This property contains a copy of all the fields associated with the class.
         */
        public function get fields():Vector.<FieldNode> {
            return _fields;
        }

        /**
         * This property contains a copy of all the methods associated with the class.
         */
        public function get methods():Vector.<MethodNode> {
            return _methods;
        }
    }
}
