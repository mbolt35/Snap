package com.bolt.asdi.tests {

    import com.bolt.asdi.tests.*;

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
