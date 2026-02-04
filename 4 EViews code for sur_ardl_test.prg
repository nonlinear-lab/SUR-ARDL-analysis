'SUR_ARDL test

matrix(2,6) mout

series y1=rec1
series y2=rec2
series y3=rec3
series y4=rec4
series y5=rec5
series y6=rec6

series x11=gdp1
series x12=gdp2
series x13=gdp3
series x14=gdp4
series x15=gdp5
series x16=gdp6

series x21=fdi1
series x22=fdi2
series x23=fdi3
series x24=fdi4
series x25=fdi5
series x26=fdi6

series x31=to1
series x32=to2
series x33=to3
series x34=to4
series x35=to5
series x36=to6

system ss1
ss1.append d(y1)=c(11)*d(x11)+c(12)*d(x21)+c(13)*d(x31)+c(14)+c(15)*@trend+c(16)*y1(-1)+c(17)*x11(-1)+c(18)*x21(-1)+c(19)*x31(-1)  
ss1.append d(y2)=c(21)*d(x12)+c(22)*d(x22)+c(23)*d(x32)+c(24)+c(25)*@trend+c(26)*y2(-1)+c(27)*x12(-1)+c(28)*x22(-1)+c(29)*x32(-1)
ss1.append d(y3)=c(31)*d(x13)+c(32)*d(x23)+c(33)*d(x33)+c(34)+c(35)*@trend+c(36)*y3(-1)+c(37)*x13(-1)+c(38)*x23(-1)+c(39)*x33(-1)  
ss1.append d(y4)=c(41)*d(x14)+c(42)*d(x24)+c(43)*d(x34)+c(44)+c(45)*@trend+c(46)*y4(-1)+c(47)*x14(-1)+c(48)*x24(-1)+c(49)*x34(-1)  
ss1.append d(y5)=c(51)*d(x15)+c(52)*d(x25)+c(53)*d(x35)+c(54)+c(55)*@trend+c(56)*y5(-1)+c(57)*x15(-1)+c(58)*x25(-1)+c(59)*x35(-1)  
ss1.append d(y6)=c(61)*d(x16)+c(62)*d(x26)+c(63)*d(x36)+c(64)+c(65)*@trend+c(66)*y6(-1)+c(67)*x16(-1)+c(68)*x26(-1)+c(69)*x36(-1) 
ss1.sur

system ss2
ss2.append d(y1)=c(11)*d(x11)+c(12)*d(x21)+c(13)*d(x31)+c(14)  
ss2.append d(y2)=c(21)*d(x12)+c(22)*d(x22)+c(23)*d(x32)+c(24)
ss2.append d(y3)=c(31)*d(x13)+c(32)*d(x23)+c(33)*d(x33)+c(34)  
ss2.append d(y4)=c(41)*d(x14)+c(42)*d(x24)+c(43)*d(x34)+c(44)  
ss2.append d(y5)=c(51)*d(x15)+c(52)*d(x25)+c(53)*d(x35)+c(54)  
ss2.append d(y6)=c(61)*d(x16)+c(62)*d(x26)+c(63)*d(x36)+c(64) 
ss2.sur

scalar ssr11=ss1.@ssr(1)
scalar ssr12=ss2.@ssr(1)
scalar ff_num=(ssr12-ssr11)/(9-4)
scalar ff_den=ssr11/(35-9-1)
scalar ff1=ff_num/ff_den
mout(1,1)=ff1
scalar ssr21=ss1.@ssr(2)
scalar ssr22=ss2.@ssr(2)
scalar ff_num=(ssr22-ssr21)/(9-4)
scalar ff_den=ssr21/(35-9-1)
scalar ff2=ff_num/ff_den
mout(1,2)=ff2
scalar ssr31=ss1.@ssr(3)
scalar ssr32=ss2.@ssr(3)
scalar ff_num=(ssr32-ssr31)/(9-4)
scalar ff_den=ssr31/(35-9-1)
scalar ff3=ff_num/ff_den
mout(1,3)=ff3
scalar ssr41=ss1.@ssr(4)
scalar ssr42=ss2.@ssr(4)
scalar ff_num=(ssr42-ssr41)/(9-4)
scalar ff_den=ssr41/(35-9-1)
scalar ff4=ff_num/ff_den
mout(1,4)=ff4
scalar ssr51=ss1.@ssr(5)
scalar ssr52=ss2.@ssr(5)
scalar ff_num=(ssr52-ssr51)/(9-4)
scalar ff_den=ssr51/(35-9-1)
scalar ff5=ff_num/ff_den
mout(1,5)=ff5
scalar ssr61=ss1.@ssr(6)
scalar ssr62=ss2.@ssr(6)
scalar ff_num=(ssr62-ssr61)/(9-4)
scalar ff_den=ssr61/(35-9-1)
scalar ff6=ff_num/ff_den
mout(1,6)=ff6

'calculation using "ardl
equation eq1.ardl(fixed, deplags=1, reglags=1,trend=linear) y1 x11 x21 x31
freeze(table21) eq1.boundstest
mout(2,1)=table21(45,2)
equation eq2.ardl(fixed, deplags=1, reglags=1,trend=linear) y2 x12 x22 x32
freeze(table22) eq2.boundstest
mout(2,2)=table22(44,2)
equation eq3.ardl(fixed, deplags=1, reglags=1,trend=linear) y3 x13 x23 x33
freeze(table23) eq3.boundstest
mout(2,3)=table23(44,2)
equation eq4.ardl(fixed, deplags=1, reglags=1,trend=linear) y4 x14 x24 x34
freeze(table24) eq4.boundstest
mout(2,4)=table24(44,2)
equation eq5.ardl(fixed, deplags=1, reglags=1,trend=linear) y5 x15 x25 x35
freeze(table25) eq5.boundstest
mout(2,5)=table25(44,2)
equation eq6.ardl(fixed, deplags=1, reglags=1,trend=linear) y6 x16 x26 x36
freeze(table26) eq6.boundstest
mout(2,6)=table26(44,2)


