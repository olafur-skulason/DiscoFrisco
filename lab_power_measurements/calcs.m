format longEng
clc
          %idle ,   allOn,      1Led,       2Leds, 3Leds
U_shunt = [0.31e-3, 104.31e-3,  29.25e-3,   72e-3, 99e-3]

R = 10.08;
U_bat = 3.2;

t = 0.25;

U_mote = U_bat-U_shunt
I_mote = U_shunt./R     
P_mote = U_mote.*I_mote
E_mote = P_mote.*t