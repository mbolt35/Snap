package com.bolt.di.util {

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