
/**
 * Mainfile of the Disco discovery algorithm, implemented for course in Wireless Sensor Networks at Aarhus University in the spring of 2018
 **/

#include "Timer.h"
#include "message.h"
//#include "RadioC.h"

#define J_PRIME 3
#define I_PRIME 2
#define DUTYCYCLE_CONSTANT 50

#define J_CYCLE (J_PRIME * DUTYCYCLE_CONSTANT)
#define I_CYCLE (I_PRIME * DUTYCYCLE_CONSTANT)

module DiscoC @safe()
{
    uses interface Timer<TMilli> as DutyCycleJ;
    uses interface Timer<TMilli> as DutyCycleI;
    uses interface RadioController;
    uses interface Boot;
}
implementation
{
    event void Boot.booted()
    {
        call DutyCycleI.startPeriodic( I_CYCLE );
        call DutyCycleJ.startPeriodic( J_CYCLE );
    }

    event void DutyCycleJ.fired()
    {
        // TODO: Run discovery
    }
    
    event void DutyCycleI.fired()
    {
        // TODO: Run discovery
    }


    event void RadioController.neighborFound(uint16_t address)
    {

    }

    event void RadioController.messageReceived(uint16_t address, message_t* message)
    {

    }
}

