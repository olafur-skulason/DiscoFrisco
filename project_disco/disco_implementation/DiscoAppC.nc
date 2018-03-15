
configuration DiscoAppC
{
}
implementation
{
  components MainC, DiscoC;

  DiscoC -> MainC.Boot;
}

