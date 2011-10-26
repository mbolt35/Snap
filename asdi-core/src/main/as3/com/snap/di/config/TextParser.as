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

package com.snap.di.config {

    /**
     * This class is used to split a single multi-line <code>String</code> into multiple single-line <code>String</code>
     * instances. This allows the implementer to parse each line one by one.
     *
     * @author Matt Bolt, Electrotank(C) 2011
     */
    public class TextParser {

        //--------------------------------------------------------------------------
        //
        //  Constants
        //
        //--------------------------------------------------------------------------

        /**
         * This constant contains the character code for a line break on linux and osx operating systems.
         */
        private static const LINE_BREAK:String = String.fromCharCode(13);

        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         * the full text
         */
        private var _text:String;

        /**
         * @private
         * this array contains each line of the parsed string
         */
        private var _lines:Array; /* of String */

        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * Creates a new <code>TextParser</code> instance.
         */
        public function TextParser(text:String) {
            _text = text;
            _lines = parse(new String(text));
        }

        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         * this process involves finding all native line breaks (windows, osx, linux) and replacing those with newline
         * characters. Then we can simply split on newline characters to produce array of lines
         */
        private function parse(text:String):Array {
            return processOsxBreaks(processWinBreaks(text)).split('\n');
        }

        /**
         * @private
         * split the string on windows breaks, then re-join using newline characters
         */
        private function processWinBreaks(text:String):String {
            const WIN_LINE_BREAK:String = LINE_BREAK + String.fromCharCode(10);

            return text.split(WIN_LINE_BREAK).join('\n');
        }

        /**
         * @private
         * split the string on osx line breaks, then re-join using newline characters
         */
        private function processOsxBreaks(text:String):String {
            return text.split(LINE_BREAK).join('\n');
        }

        /**
         * @inheritDoc
         */
        public function toString():String {
            return _text;
        }

        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------

        /**
         * This property contains the full un-parsed text.
         */
        public function get text():String {
            return _text;
        }

        /**
         * This property contains a read-only <code>Array</code> of <code>String</code> representing each line in the
         * text.
         */
        public function get lines():Array {
            return _lines.concat();
        }
    }
}

