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
     * This interface defines a prototype for an object that generates binding classes for a base <code>Class</code>.
     *
     * @author Matt Bolt, mbolt35&#64;gmail.com
     */
    public interface IBinderFactory {

        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------

        /**
         * This class creates and returns an <code>IBinder</code> implementation for a base <code>Class</code>.
         *
         * @param base The base <code>Class</code> used as the target for the binding.
         *
         * @return A new instance of an <code>IBinder</code> implementation.
         */
        function bindingFor(base:Class):IBinder;

    }
}
