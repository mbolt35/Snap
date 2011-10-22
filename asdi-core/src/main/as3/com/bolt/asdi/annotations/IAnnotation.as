package com.bolt.asdi.annotations {

    /**
     * This interface represents an annotation that can be used with BoltDI.
     * 
     * @author Matt Bolt
     */
    public interface IAnnotation {

        function init(metaData:XML):void;

        function valueFor(key:String):String;

        function get name():String;
    }
}
