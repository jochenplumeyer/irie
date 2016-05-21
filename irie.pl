#!/usr/bin/perl -w

use strict;
use YAML::XS;
use Data::Dumper;

my ($i, %a, $c);
$i=0;

$c=<<EndOfCode;
Ich NameIst "Jochen".
Ich GeborenAm "8.1.1968".
Ding AttributName "Datum".
EndOfCode

print "This is the code:\n$c\n";
