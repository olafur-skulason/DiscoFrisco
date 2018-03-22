

/**
 * Interface used in radio operator for the disco protocol.
 */

#include "message.h"

interface RadioController {
    command void sendDiscoveryMessage();
    command void sendMessage(message_t* message);
    event void neighborFound(uint16_t address); // Will be signaled if neighbors are found.
    event void messageReceived(uint16_t address, message_t* message);
}

