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

    import com.snap.di.util.LogUtil;

    import mx.logging.ILogger;
    import mx.logging.Log;


    /**
     * This class is used as the default <code>IBinder</code> implementation.
     *
     * @author Matt Bolt, mbolt35&#64;gmail.com
     */
    public class DefaultBinder implements IBinder {

        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         * mx logger
         */
        private static const log:ILogger = Log.getLogger(LogUtil.categoryFor(prototype));

        /**
         * @private
         * binding manager for mapping the implementations
         */
        private var _manager:IBindingManager;

        /**
         * @private
         * the base class that's mapped *to*
         */
        private var _base:Class;


        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * Creates a new <code>DefaultBinder</code> instance.
         */
        public function DefaultBinder(base:Class, manager:IBindingManager) {
            _base = base;
            _manager = manager;
        }


        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------

        /**
         * @inheritDoc
         */
        public function to(implementation:Class):void {
            _manager.add(_base, implementation);
        }
    }
}
