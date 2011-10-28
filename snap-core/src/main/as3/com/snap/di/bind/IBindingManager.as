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
     * This interface defines a prototype for a manager object which handles all binding relationships.
     * 
     * @author Matt Bolt, mbolt35&#64;gmail.com
     */
    public interface IBindingManager {

        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------

        /**
         * The binding manager performs the actual binding between a base class and it's implementing class.
         *
         * @param base The base <code>Class</code> to bind the implementation to.
         *
         * @param bindedTo The implementation <code>Class</code> to bind to the base.
         */
        function add(base:Class, bindedTo:Class):void;
        
    }
}
