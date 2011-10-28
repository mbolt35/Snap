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

package com.snap.di.config {

    import flash.utils.Dictionary;


    /**
     * This class represents an INI file mapping, which has a [GLOBAL] section, and also user-defined
     * sections as well.
     *
     * @example
     * This example demonstrates how to use the <code>IniProperties</code> class:
     *
     * <listing version="3.0">
     * var loadedIniFile:String = // ...
     * var ini:IniProperties = new IniProperties(loadedIniFile);
     * ini.activeSection = "FIRST_SECTION"; // Set the active section -- otherwise, it will default to [GLOBAL]
     * </listing>
     *
     * @author Matt Bolt
     */
    public class IniProperties {

        //--------------------------------------------------------------------------
        //
        //  Constants
        //
        //--------------------------------------------------------------------------

        /**
         * This constant value represents the first tag of the INI file -- it contains all of the default values used
         * to use in your configuration
         */
        public static const GLOBAL:String = "global";

        /**
         * @private
         * this constant value contains the regular expression for parsing the tags in a string
         */
        private static const TAG_REGEX:RegExp = /(\[[a-zA-Z0-9\-\_]+\])/g;

        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         * this represents the active section to use when retrieving values.
         */
        private var _activeSection:String = GLOBAL;

        /**
         * @private
         * this property object contains all of the [GLOBAL] definitions
         */
        private var _global:Properties;

        /**
         * @private
         * this dictionary contains Properties object key'd by the tag name
         */
        private var _sections:Dictionary /* <String, Properties> */ = new Dictionary();

        /**
         * @private
         * this list holds all of the section names parsed
         */
        private var _sectionNames:Vector.<String> = Vector.<String>([ GLOBAL ]);

        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * Creates a new <code>IniProperties</code> instance.
         *
         * @param text The <code>String</code> representing the contents of an INI file.
         */
        public function IniProperties(text:String) {
            parse(text);
        }

        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------

        /**
         * This method returns the <code>String</code> value for a property key. This method returns the value for the
         * <code>activeSection</code> property.
         *
         * @param key The key to lookup the value for.
         *
         * @return A <code>String</code> representation of the value if it exists. <code>null</code> if the value does
         * not exist.
         */
        public function valueFor(key:String):String {
            var globalValue:String = _global.valueFor(key);
            if (equalsNoCase(activeSection, GLOBAL)) {
                return globalValue;
            }

            var properties:Properties = sectionFor(activeSection);
            if (!properties) {
                return globalValue;
            }

            var value:String = properties.valueFor(key);

            return !value ? globalValue : value;
        }

        /**
         * @private
         * this method parses each section of the ini
         */
        private function parse(text:String):void {
            var labels:Array = text.split(TAG_REGEX);

            // Shift off everything until the first tag
            labels.shift();

            for (var i:int = 0; i < labels.length; ++i) {
                // Always use lower case for tag labels -- keeps look-ups simple
                var tag:String = tagFor(labels[i]).toLowerCase();

                if (i == 0) {
                    if (!equalsNoCase(tag, GLOBAL)) {
                        throw new Error("The first section of the INI file should always be [GLOBAL].");
                    }

                    _global = new Properties(labels[++i]);
                    continue;
                }

                _sections[tag] = new Properties(labels[++i]);
                _sectionNames.push(tag);
            }
        }

        /**
         * @private
         * this method extracts the tag name from the [TAG] string
         */
        private function tagFor(text:String):String {
            return text.substring(1, text.length - 1);
        }

        /**
         * @private
         * returns the properties object for the tag name if it exists -- otherwise, returns global
         */
        private function sectionFor(tag:String):Properties {
            return Properties(_sections[tag.toLowerCase()]);
        }

        /**
         * @private
         * this method compares case-insensitive strings
         */
        private function equalsNoCase(source:String, target:String):Boolean {
            if (!source || !target) {
                return false;
            }

            return source.toLowerCase() == target.toLowerCase();
        }

        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------

        /**
         * This property contains a listing of the available section names in this ini properties config.
         */
        public function get availableSections():Vector.<String> {
            return _sectionNames.concat();
        }

        /**
         * This property represents the active section name to use when looking up property values. It is case
         * insensitive.
         */
        public function get activeSection():String {
            return _activeSection;
        }

        /**
         * @private
         */
        public function set activeSection(value:String):void {
            _activeSection = value;
        }
    }
}
