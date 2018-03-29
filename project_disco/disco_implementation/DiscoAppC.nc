
#define AM_DISCORADIO 6

configuration DiscoAppC { }
implementation
{
    components MainC, DiscoC, RadioM;
    components new TimerMilliC() as DutyCycleJ;
    components new TimerMilliC() as DutyCycleI;

    components new AMSenderC(AM_DISCORADIO);
    components new AMReceiverC(AM_DISCORADIO);

    DiscoC -> MainC.Boot;
    DiscoC.DutyCycleJ -> DutyCycleJ;
    DiscoC.DutyCycleI -> DutyCycleI;
    DiscoC.RadioController -> RadioM;

    RadioM.Send -> AMSenderC;
    RadioM.Receive -> AMReceiverC;
    RadioM.Packet -> AMSenderC;
}

