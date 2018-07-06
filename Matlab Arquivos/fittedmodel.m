function vwind = fittedmodel(altura,pwm)

       p00 =       18.79;
       p10 =      -0.571;
       p01 =      0.2565;
       p20 =      0.0136;
       p11 =   -0.005502;
       p02 =  -0.0005601;
       p30 =   -0.000113;
       p21 =   4.503e-05;
       p12 =   5.745e-06;
       p03 =   3.291e-07;
       
       x=altura;
       y=pwm;

vwind= p00 + p10*x + p01*y + p20*x^2 + p11*x*y + p02*y^2 + p30*x^3 + p21*x^2*y + p12*x*y^2 + p03*y^3;
if vwind <0 
    vwind=0;
end

end
