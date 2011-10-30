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
     * This class defines a field (public variable or getter/setter) for a specific class.
     *
     * @author Matt Bolt, mbolt35&#64;gmail.com
     */
    public final class FieldNode {

        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         * the level of access for the field
         */
        private var _access:FieldAccess;

        /**
         * @private
         * the type of field
         */
        private var _type:String;

        /**
         * @private
         * the class that contains the field
         */
        private var _declaredBy:String;


        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * Creates a new <code>FieldNode</code> instance.
         */
        public function FieldNode(access:FieldAccess, type:String, declaredBy:String) {
            _access = access;
            _type = type;
            _declaredBy = declaredBy;
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
            return "[FieldNode - access: " + _access.type + ", type: " + _type + ", declaredBy: " + _declaredBy + "]";
        }


        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------

        /**
         * This property contains the <code>FieldAccess</code> that represents whether or not a user can read and/or
         * write to the field.
         */
        public function get access():FieldAccess {
            return _access;
        }

        /**
         * This property contains the fully qualified type name for the field.
         */
        public function get type():String {
            return _type;
        }

        /**
         * This property contains the fully qualified name of the object containing the field.
         */
        public function get declaredBy():String {
            return _declaredBy;
        }
    }
}
