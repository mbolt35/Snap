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

package com.snap.di.config{

    import flash.utils.Dictionary;


    /**
     * This class represents a list of properties and the values associated with those properties. More commonly, this
     * class is used to represent the contents of a <code>.properties</code> file:
     *
     * @example
     * This example shows what a .properties file looks like.
     *
     * <listing version="3.0">
     * my.property=someValue
     * my.option=someOption
     * </listing>
     *
     * @author Matt Bolt, mbolt35&#64;gmail.com
     */
    public class Properties {

        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         * holds the property names and values
         */
        private var _properties:Dictionary = new Dictionary();

        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * Creates a new <code>Properties</code> instance.
         *
         * @param text A <code>String</code> representing the contents of the properties file.
         */
        public function Properties(text:String) {
            parse(text);
        }

        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------

        /**
         * This method returns the <code>String</code> value for a property key.
         *
         * @param key The key to lookup the value for.
         *
         * @return A <code>String</code> representation of the value if it exists. <code>null</code> if the value does
         * not exist.
         */
        public function valueFor(key:String):String {
            return _properties[key];
        }

        /**
         * @private
         * parses the properties text.
         */
        private function parse(text:String):void {
            var lines:Array /* of String */ = new TextParser(text).lines;

            var key:String;
            var value:String;
            var lastKey:String;
            var lastValue:String;
            var nextLine:Boolean = false;

            for each (var line:String in lines) {
                if (!isParsableLine(line)) {
                    continue;
                }

                if (nextLine) {
                    key = lastKey;
                    value = lastValue + line;
                    nextLine = false;
                } else {
                    var index:int = separationIndexFor(line);
                    lastKey = key = rightTrim(line.substr(0, index));
                    lastValue = value = line.substring(index + 1);
                }

                value = leftTrim(value);

                if (value.charAt(value.length - 1) == "\\") {
                    lastValue = value = value.substr(0, value.length - 1);
                    nextLine = true;
                    continue;
                }
                
                _properties[key] = value.replace(/\\n/gm, "\n");
            }
        }

        /**
         * @private
         * checks for comments and legal text lengths
         */
        private function isParsableLine(line:String):Boolean {
            return line.indexOf('#') != 0 && line.indexOf('!') != 0 && line.length != 0;
        }

        /**
         * @private
         * find the separation index for the line
         */
        private function separationIndexFor(line:String):int {
            for (var i:int = 0; i < line.length; ++i) {
                var current:String = line.charAt(i);

                if (isBreakingCharacter(current)) {
                    break;
                }

                if (isSingleQuote(current)) {
                    i += 1;
                }
            }

            return i == line.length ? line.length : i;
        }

        /**
         * @private
         * is breaking character between key and property
         */
        private function isBreakingCharacter(ch:String):Boolean {
            return ch == ':' || ch == '=' || ch == "     ";
        }

        /**
         * @private
         * whether or not the character is a single quotation
         */
        private function isSingleQuote(ch:String):Boolean {
            return ch == "'";
        }

        /**
         * @private
         * trims control characters
         */
        private function trim(line:String):String {
            if (null == line) {
                return null;
            }

            return line.replace(/^\s*/, '').replace(/\s*$/, '');
        }

        /**
         * @private
         * left trim for control characters
         */
        private function leftTrim(str:String):String {
            const TRIM:String = "\n\t\n ";

            var from:Number = 0;
            var to:Number = str.length;

            while (from < to && TRIM.indexOf(str.charAt(from)) >= 0) {
                from++;
            }

            return from > 0 ? str.substr(from, to) : str;
        }

        /**
         * @private
         * right trim of control characters.
         */
        private function rightTrim(str:String):String {
            const TRIM:String = "\n\t\n ";

            var from:Number = 0;
            var to:Number = str.length - 1;

            while (from < to && TRIM.indexOf(str.charAt(to)) > 0) {
                to--;
            }

            return to >= 0 ? str.substr(from, to + 1) : str;
        }

        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------

    }
}
