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

    import com.snap.di.util.LogUtil;

    import flash.utils.Dictionary;

    import mx.logging.ILogger;
    import mx.logging.Log;


    /**
     *
     * @author Matt Bolt
     */
    public class DefaultAnnotationFactory implements IAnnotationFactory {

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
         * annotation name -> class mapping
         */
        private var _annotations:Dictionary = new Dictionary();


        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * Creates a new <code>AnnotationFactory</code> instance.
         */
        public function DefaultAnnotationFactory(...annotations) {
            for each (var AnnotationDefinition:Class in annotations) {
                var instance:IAnnotation = new AnnotationDefinition() as IAnnotation;
                if (!instance) {
                    continue;
                }

                log.debug("Adding annotation: {0}", instance.name);
                _annotations[instance.name] = AnnotationDefinition;
            }
        }


        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------

        /**
         * @inheritDoc
         */
        public function annotationFor(metaData:XML):IAnnotation {
            var key:String = metaData.@name.toString();

            if (!key || !_annotations[key]) {
                log.warn("Annotation type: {0} is not a valid annotation.", metaData.@name);
                return null;
            }

            var AnnotationDefinition:Class = _annotations[key];
            var annotation:IAnnotation = IAnnotation(new AnnotationDefinition());
            annotation.init(metaData);

            return annotation;
        }
    }
}
