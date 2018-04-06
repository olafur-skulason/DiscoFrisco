/**
 * Presenter implementation
 **/

#include "Timer.h"

#define FOUND_TIME 2000
#define AWAKE_TIME 10

module PresentM @safe()
{
    uses interface Leds;
    uses interface Timer<TMilli> as AwakeTimer;
    uses interface Timer<TMilli> as FoundTimer;
    provides interface Present;
}
implementation
{
    command void Present.awake() {
        call Leds.led0On();
        call AwakeTimer.startOneShot(AWAKE_TIME);
    }
    
    command void Present.found() {
	call Leds.led1On();
        call Leds.led2On();
        call FoundTimer.startOneShot(FOUND_TIME);
    }

    event void AwakeTimer.fired() {
        call Leds.led0Off();
    }

    event void FoundTimer.fired() {
        call Leds.led1Off();
        call Leds.led2Off();
    }

}

