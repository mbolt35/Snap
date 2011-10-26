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

package com.snap.di.tests {

    import com.snap.di.tests.*;

    import flash.system.System;

    [InjectConstructor]
    public class SomeClass implements SomeInterface {

        private static var staticVar:int = 50;
        
        private var foo:int = 5;
        private var _ac:AnotherClass;

        [Inject]
        [Name(param="test")]
        public var bar:int = 10;

        /**
         * Creates a new <code>SomeClass</code> instance.
         */
        public function SomeClass(ac:AnotherClass) {

        }

        public function someMethod(a:AnotherClass, b:int):String {
            return "";
        }

        [Inject]
        public function annotatedMethod():Boolean {
            return true;
        }

        public function get someProperty():AnotherClass {
            return _ac;
        }
    }
}
