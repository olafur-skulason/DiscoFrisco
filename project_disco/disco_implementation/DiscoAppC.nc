
#define AM_DISCORADIO 6

configuration DiscoAppC { }
implementation
{
    components MainC, LedsC, DiscoC, RadioM, PresentM;
    components new TimerMilliC() as DutyCycleJ;
    components new TimerMilliC() as DutyCycleI;
    components new TimerMilliC() as AwakeTimer;
    components new TimerMilliC() as FoundTimer;
    components new AMSenderC(AM_DISCORADIO);
    components new AMReceiverC(AM_DISCORADIO);

    DiscoC -> MainC.Boot;
    DiscoC.DutyCycleJ -> DutyCycleJ;
    DiscoC.DutyCycleI -> DutyCycleI;
    DiscoC.RadioController -> RadioM;
    DiscoC.Present -> PresentM;

    RadioM.Send -> AMSenderC;
    RadioM.Receive -> AMReceiverC;
    RadioM.Packet -> AMSenderC;

    PresentM.Leds -> LedsC;
    PresentM.AwakeTimer -> AwakeTimer;   
    PresentM.FoundTimer -> FoundTimer;   
}

