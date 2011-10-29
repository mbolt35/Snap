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
     * This class contains an enumeration of field access constants.
     *
     * @author Matt Bolt
     */
    public final class FieldAccess {

        //--------------------------------------------------------------------------
        //
        //  Constants
        //
        //--------------------------------------------------------------------------

        /**
         * This constant is set on a field when there exists a getter method, but not a setter.
         */
        public static const READ_ONLY:String = "readonly";

        /**
         * This constant is set on a field when there exists a setter method, but not a getter.
         */
        public static const WRITE_ONLY:String = "writeonly";

        /**
         * This constant is set on a field when there exists a getter and a setter method.
         */
        public static const READ_WRITE:String = "readwrite";


        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         */
        public function FieldAccess() {
            throw new Error("Static access only.");
        }

    }
}
