

/**
 * Implementation of the radio interface used in the disco protocol.
 **/

#include "AM.h"
#include "Radio.h"


module RadioM {
        uses interface AMSend as Send;
        uses interface Receive;
        uses interface SplitControl as AMControl;
        uses interface Packet;
        uses interface AMPacket;
        provides interface RadioController;
    }

    implementation {

        message_t packet;
        bool busy = FALSE;

        // Initialize radio componenets
        command void RadioController.start() {
            call AMControl.start();
        }

        command void RadioController.sendDiscoveryMessage() {
            radio_discovery_msg * msg = NULL;
            if (busy == TRUE)
                return;

            // TODO: Send radio message.
            msg = (radio_discovery_msg*)(call Packet.getPayload(&packet, sizeof(radio_discovery_msg)));
            if (msg == NULL) {
                return;
            }

            msg->MSG = DISCO_MSG;
            msg->ID = TOS_NODE_ID;

            if (call Send.send(AM_BROADCAST_ADDR, &packet, sizeof(radio_discovery_msg)) == SUCCESS) {
                busy = TRUE;
            }
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
            radio_discovery_msg* message = NULL;

            if (len == sizeof(radio_discovery_msg)) {
                message = (radio_discovery_msg*)msg;
                signal RadioController.neighborFound(message->ID);
            }
            else {
                //signal RadioController.messageReceived(1, msg);
            }
            
            return msg;
        }

        event void AMControl.startDone(error_t err) {
            if(err == SUCCESS) {
                
            }
        }

        event void AMControl.stopDone(error_t err) {

        }
    }
