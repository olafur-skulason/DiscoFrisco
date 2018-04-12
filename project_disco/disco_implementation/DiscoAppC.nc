
configuration DiscoAppC { }
implementation
{
    components MainC, LedsC, DiscoC, RadioM, PresentM;
    components ActiveMessageC;
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

    RadioM.AMControl -> ActiveMessageC;
    RadioM.Send -> AMSenderC;
    RadioM.Receive -> AMReceiverC;
    RadioM.AMPacket -> AMSenderC;
    RadioM.Packet -> AMSenderC;

    PresentM.Leds -> LedsC;
    PresentM.AwakeTimer -> AwakeTimer;   
    PresentM.FoundTimer -> FoundTimer;   
}

