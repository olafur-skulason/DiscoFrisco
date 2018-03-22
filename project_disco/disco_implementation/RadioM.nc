

/**
 * Implementation of the radio interface used in the disco protocol.
 **/

#include "AM.h"
//#include "Radio.h"

module RadioM {
        uses interface AMSend as Send;
        uses interface Receive;
        uses interface SplitControl as AMControl;
        uses interface Packet;
        provides interface RadioController;
    }

    implementation {

        message_t packet;
        bool busy = FALSE;

        // Initialize radio componenets
        void start() {
            call AMControl.start();
        }

        command void RadioController.sendDiscoveryMessage() {
            if (busy == TRUE)
                return;
            else
                busy = TRUE;

            // TODO: Send radio message.
        }

        command void RadioController.sendMessage(message_t* message) {
            // Send a payload message.
        }

        event void Send.sendDone(message_t* msg, error_t err) {
            if (&packet == msg) {
                busy = FALSE;
            }
        }


        event message_t* Receive.receive(message_t* msg, void* payload, uint8_t len) {
            
            return msg;
        }

// THIS PART MAY BE UNNECCESSARY: IF SO REMOVE AMControl
        event void AMControl.startDone(error_t err) {
            if(err == SUCCESS) {
                
            }
        }

        event void AMControl.stopDone(error_t err) {

        }
// END AMControl PART HERE
    }
