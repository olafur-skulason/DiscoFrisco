

/**
 * Interface used in radio operator for the disco protocol.
 */

#include "message.h"

interface RadioController {
    command void start();
    command void stop();
    command void sendDiscoveryMessage();
    command void sendOnlineMessage();
    command void sendMessage(message_t* message);
    event void startDone();
    event void neighborFound(uint16_t address); // Will be signaled if neighbors are found.
    event void messageReceived(uint16_t address, message_t* message);
    event void discoveryFinished(); // Will be signaled when the discovery process is done.
}

