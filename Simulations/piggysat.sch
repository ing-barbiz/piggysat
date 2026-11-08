<QucsStudio Schematic 5.9>
<Properties>
View=0,-26.6667,1215,1000,1,0,0
Grid=10,10,1
DataSet=*.dat
DataDisplay=*.dpl
OpenDisplay=3
showFrame=0
FrameText0=Title \n @PATH@@FILE@
FrameText1=Drawn By:
FrameText2=Date: @DATE@
FrameText3=Revision:
</Properties>
<Symbol>
</Symbol>
<Components>
GND * 1 60 220 0 0 0
GND * 1 420 220 0 0 0
Pac P1 1 60 190 18 -26 0 "1"1"50 Ω"1"0 dBm"0"1 GHz"0"26.85"0"con_2"0
GND * 1 310 220 0 0 0
.SP SP1 1 70 320 0 10 0 "lin"1"1.4 GHz"1"1.70 GHz"1"500"1"no"1"1"0"2"0"none"0
C C1 1 180 160 -26 17 0 "2.2 pF"1"0"0""0"neutral"0"SMD0603"0
SPfile X1 1 420 160 -26 -59 0 "G:/My Drive/Progetti/PiggySat/Measurements/s11_uncomp.s1p"1"1"0"polar"0"linear"0"short"0"none"0"block"0"SOT23"0
L L1 1 310 190 -75 -26 3 "6.8 nH"1"0"0""0"inductor_1mH"0
</Components>
<Wires>
420 190 420 220
210 160 310 160
60 160 150 160
310 160 390 160
</Wires>
<Diagrams>
<Rect 570 240 360 220 71 #c0c0c0 1 00 1 1.4e+09 5e+07 1.7e+09 1 -1 0.5 1 1 -16.0269 5 -1.6219 -1 -1 -1 "" "" "">
	<Legend 10 -100 0>
	<"dB(S[1,1])" "" #ff0000 2 3 0 0 1 0 "">
	  <Mkr 1.57315e+09 -120 -240 3 1 0 0 0 50>
	  <Mkr 1.64349e+09 410 -220 3 1 0 0 0 50>
</Rect>
<Smith 570 680 373 373 31 #c0c0c0 1 00 1 0 1 1 1 0 4 1 1 0 4 1 -1 -1 -1 "" "" "">
	<Legend 10 -100 0>
	<"S[1,1]" "" #0000ff 2 3 0 0 0 1 "">
	  <Mkr 1.63988e+09 210 -320 3 1 0 0 1 50>
	  <Mkr 1.53888e+09 -70 -290 3 1 0 0 1 50>
</Smith>
</Diagrams>
<Paintings>
</Paintings>
