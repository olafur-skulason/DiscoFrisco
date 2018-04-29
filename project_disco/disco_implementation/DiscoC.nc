
/**
 * Mainfile of the Disco discovery algorithm, implemented for course in Wireless Sensor Networks at Aarhus University in the spring of 2018
 **/

#include "Timer.h"
#include "message.h"
//#include "RadioC.h"

enum {
  AM_DISCORADIO = 8
};
#define DEFINED_TOS_AM_GROUP 0x07 // Define the radio group
#define DUTYCYCLE_CONSTANT 100
#define LISTEN_PERIOD 100
//#define BLOCK_LEDS // uncomment to see leds
#define DISCOVERY_RESET // uncomment to enable disco test mode

#define J_PRIME 23
#define I_PRIME 157

#define J_CYCLE (J_PRIME * DUTYCYCLE_CONSTANT)
#define I_CYCLE (I_PRIME * DUTYCYCLE_CONSTANT)

module DiscoC @safe()
{
    uses interface Timer<TMilli> as DutyCycleJ;
    uses interface Timer<TMilli> as DutyCycleI;
    uses interface RadioController;
    uses interface Present;
    uses interface Boot;
}
implementation
{
    bool active_discovery = FALSE;
    void onAwake() 
    {
        if (active_discovery == FALSE) {
            active_discovery = TRUE;
            call RadioController.start();
        }
    }
    
    event void RadioController.startDone()
    {
        call Present.awake();
        call RadioController.sendDiscoveryMessage();
    }

    event void Boot.booted()
    {
        call DutyCycleI.startPeriodic( I_CYCLE );
        call DutyCycleJ.startPeriodic( J_CYCLE );
    }

    event void DutyCycleJ.fired() {
        onAwake();
    }
    
    event void DutyCycleI.fired() {
        onAwake();
    }

    event void RadioController.neighborFound(uint16_t address)
    {
        call Present.found();
        #ifndef DISCOVERY_RESET
        call DutyCycleI.stop();
        call DutyCycleJ.stop();
        call DutyCycleI.startPeriodic( I_CYCLE );
        call DutyCycleJ.startPeriodic( J_CYCLE );
        #endif
    }

    event void RadioController.messageReceived(uint16_t address, message_t* message)
    {
    }

    event void RadioController.discoveryFinished()
    {
        call RadioController.stop();
        active_discovery = FALSE;
    }
}

