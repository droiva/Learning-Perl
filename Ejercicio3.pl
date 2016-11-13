#!/usr/bin/perl -w
use strict;
use Scalar::Util qw(looks_like_number);

#my $x = 600851475143;
# maximo comun divisor nunca va a ser mayor a raiz cuadrada del numero en cuestion
my $x;
print "Bienvenido al modulo creado por droiva para hallar el maximo comun divisor de un numero\n Introduzca por favor el numero problema:\n";
while (1) {
    my $x = <STDIN>;
    chomp $x;
    if (looks_like_number ($x)) {
        last;
    } else {
        print "Perdon, no te he entendido, vuelve a escribirlo\n";
    }
}
#Este while anterior me falla. Necesito tu sabio consejo. El valor de x no se me guarda al salir del loop, don't know why
maxcomdiv($x);

sub maxcomdiv {
    my @odd = (1,2);
    for (my $i=3; $i < $x; $i++) {
        my $y=2;
        my $z = 0;
        while ($y<$i) {
            unless($i % $y != 0) {
                $z++
            }
            $y++;
        }
        unless ($z!= 0) {
            push @odd, $i
        }
    }
    my @oddquery;
    foreach my $n (@odd) {
        unless ($x % $n != 0) {
            push @oddquery, $n;
        }    
    }
   
    my $a = 0;
    foreach my $m (@oddquery) {
        unless ($a > $m) {
            $a = $m
        }
    }
    print "'El maximo comun divisor es '$a\n";
    print "Pulse cualquier tecla para salir\n";
    <STDIN>;
}