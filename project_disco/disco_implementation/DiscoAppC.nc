
configuration DiscoAppC { }
implementation
{
    components MainC, DiscoC, RadioM;
    components new TimerMilliC() as DutyCycleJ;
    components new TimerMilliC() as DutyCycleI;

    DiscoC -> MainC.Boot;
    DiscoC.DutyCycleJ -> DutyCycleJ;
    DiscoC.DutyCycleI -> DutyCycleI;
    DiscoC.RadioController -> RadioM;
}

