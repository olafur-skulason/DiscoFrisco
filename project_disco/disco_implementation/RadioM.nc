

/**
 * Implementation of the radio interface used in the disco protocol.
 **/

#include "AM.h"
//#include "Radio.h"

module RadioM {
        uses interface AMSend as Send;
        uses interface Receive;
        uses interface SplitControl as AMControl;
        uses interface AMPacket as RadioPacket;
    }

    implementation {

        // Initialize radio componenets
        void Start() {
            call AMControl.start();
        }

        void SendDiscoveryMessage() {
            
        }

        event void Send.sendDone(message_t* msg, error_t err) {
            
        }

        event void AMControl.startDone(error_t err) {

        }

        event void AMControl.stopDone(error_t err) {

        }

        event message_t* Receive.receive(message_t* msg, void* payload, uint8_t len) {
            return msg;
        }
    }
