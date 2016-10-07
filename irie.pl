#!/usr/bin/perl -w

use strict;
use YAML::XS;
use Data::Dumper;
use utf8;
my (%h, %d);

# Objekte für den Beginn sollen sein:
# Für UNIX-Systeme:
# 	Prozeß
# 	Befehl
# 	Verzeichnis
# 	Datei

$d{"process"}{"name-de"}="Prozeß";

# Einhängen des temporären Datenbaumes in die globale
# Hierarchie-Datenstruktur
$h{"UNIX systems"}=\%d;
# Differenz zu anderen, Nicht-UNIX Systemen
# 
# Danach würden hinzukommen:
# 	Host
# 	Domain
# 	Netzwerkdienste
# 	IP:Port
# 	URL
# 	Geographische Position

print Dumper(\%h);
print Dump(\%h);
