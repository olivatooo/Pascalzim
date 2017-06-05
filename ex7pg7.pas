Program ex7pg7 ;
var p,h,imc:real;
 Begin
    writeln('Digite seu peso em kg');
    readln(p);
    writeln('Digite sua altura em m');
    readln(h);
    imc:=p/(h*h);
    write('Seu IMC é ',imc);
 End.
