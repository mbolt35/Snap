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

package com.snap.di.annotations {
    

    /**
     * This interface defines a prototype for an annotation "matcher" that links <code>XML</code> metadata defined in a
     * a class to a specific implementation of that annotation at run-time.
     * 
     * @author Matt Bolt, mbolt35&#64;gmail.com
     */
    public interface IAnnotationFactory {

        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------

        /**
         * This method returns a registered annotation handler give the <code>XML</code> meta data provided.
         *
         * @param metaData The <code>XML</code> representing the metadata pulled from
         * <code>flash.util.describeType()</code>.
         *
         * @return The <code>IAnnotation</code> pertaining to the meta data. If there isn't a defined (and registered)
         * <code>IAnnotation</code>, then a <code>null</code> value is returned.
         */
        function annotationFor(metaData:XML):IAnnotation;


        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------


    }
}
