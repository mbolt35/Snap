////////////////////////////////////////////////////////////////////////////////
//
//  MATTBOLT.BLOGSPOT.COM
//  Copyright(C) 2010 Matt Bolt
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

package com.snap.di.util {

    import flash.utils.getQualifiedClassName;


    /**
     * This class contains static methods which can be used to perform common logging tasks.
     */
    public final class LogUtil {

        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------

        /**
         * This static function accepts the <code>prototype Object</code> in a
         * <code>Class</code> and returns the logger category <code>String</code>
         * in the form <code>PACKAGE_NAME.CLASS_NAME</code>.
         *
         * Note that this class will allow you to use a <code><strong>const</strong>
         * </code> logger in a generic way.
         */
        public static function categoryFor(prototype:Object):String {
            return getQualifiedClassName(prototype["constructor"]).replace(/::/g, ".");
        }

    }

}