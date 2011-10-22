package com.bolt.asdi.util {

    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.XMLSocket;

    import mx.logging.ILogger;
    import mx.logging.Log;
    import mx.logging.LogEvent;
    import mx.logging.targets.LineFormattedTarget;

    /**
     * Creates a log target for use with SOS (Socket Output Server) Logger.
     */
    public class SOSLogTarget extends LineFormattedTarget {

        //--------------------------------------------------------------------------
        //
        //  Variables
        //
        //--------------------------------------------------------------------------

        /**
         * @private
         * the socket server host
         */
        private var _server:String = "localhost";

        /**
         * @private
         * the socket server port
         */
        private var _port:int = 4444;

        /**
         * @private
         * log history
         */
        private var _history:Array = [];

        /**
         * @private
         * the xml socket instance used to log
         */
        private var _socket:XMLSocket = new XMLSocket();


        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        /**
         * Creates a new <code>SOSLogTarget</code> instance.
         */
        public function SOSLogTarget() {

        }

        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------

        /**
         * @inheritDoc
         */
        public override function logEvent(event:LogEvent):void {
            if (!_socket) {
                return;
            }

            var log:Object = {
                message: event.message
            };

            if (includeLevel) {
                log.level = LogEvent.getLevelString(event.level);
            }

            log.category = includeCategory ? ILogger(event.target).category : "";

            if (_socket.connected) {
                send(log);
                return;
            }

            // Start Connection
            if (!isConnecting) {
                addListeners();

                _socket.connect(_server, _port);
            }

            // Push log to history
            _history.push(log);
        }

        /**
         * @private
         * handle connection
         */
        private function onSocketConnect(event:Event):void {
            while (_history.length > 0) {
                send(_history.shift());
            }
        }

        /**
         * @private
         * handle any io errors
         */
        private function onIOError(event:IOErrorEvent):void {
            cleanup(event.text);
        }

        /**
         * @private
         * handle any security errors
         */
        private function onSecurityError(event:SecurityErrorEvent):void {
            cleanup(event.text);
        }

        /**
         * @private
         * closes the socket, clears history, and removes the target
         */
        private function cleanup(error:String = ""):void {
            removeListeners();

            _history = [];
            _socket = null;

            Log.removeTarget(this);
            Log.getLogger("SOSLogTarget").error("XMLSocket Error {0}", error);
        }

        /**
         * @private
         * adds the socket listeners
         */
        private function addListeners():void {
            if (_socket) {
                _socket.addEventListener(Event.CONNECT, onSocketConnect);
                _socket.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
                _socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
            }
        }

        /**
         * @private
         * removes socket listeners
         */
        private function removeListeners():void {
            if (_socket) {
                _socket.removeEventListener(Event.CONNECT, onSocketConnect);
                _socket.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
                _socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
            }
        }

        /**
         * @private
         * sends the log to the xml socket
         */
        private function send(log:Object):void {
            var msg:String = log.message;
            var lines:Array = msg.split("\n");
            var commandType:String = lines.length == 1 ? "showMessage" : "showFoldMessage";
            var key:String = log.level;
            var prefix:String = "";

            if (log.category) {
                prefix += log.category + fieldSeparator;
            }

            try {
                var xmlMessage:XML = <{commandType} key={key} />;

                if (lines.length > 1) {
                    xmlMessage.title = prefix + lines[0];
                    xmlMessage.message = msg.substr(msg.indexOf("\n") + 1, msg.length);
                } else {
                    xmlMessage.appendChild(prefix + msg);
                }

                _socket.send("!SOS" + xmlMessage.toXMLString() + "\n");
            } catch (error:Error) {
                Log.getLogger("SOSLogTarget").warn("XML Format Error for SOS Message");
            }
        }

        /**
         * @private
         * returns true if the socket connection is taking place.
         */
        private function get isConnecting():Boolean {
            return _socket && !_socket.connected && _socket.hasEventListener(Event.CONNECT);
        }

    }
}