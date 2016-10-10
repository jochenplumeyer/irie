#!/usr/bin/perl -w

use strict;
use YAML::XS;
use Data::Dumper;
use utf8;
my (%h, %d, $key);

# Objekte für den Beginn sollen sein:
# Für UNIX-Systeme:
# 	Prozeß
# 	Befehl
# 	Verzeichnis
# 	Datei

$d{"process"}{"meta"}{"name"}{"de"}="Prozeß";
$d{"process"}{"meta"}{"maincontext"}{"operating systems"}="UNIX";
# Verbalisierung der Sätze:
- Prozesse machen die eigentliche Arbeit eines Computers
- hat eine eindeutige natürliche Zahl zugeordnet (also eine ID), die "process ID", ("pid").
- im Verzeichnis /proc/$pid befinden sich alle Informationen über den Prozeß
  - exe: Pfad des gestarteten Programms
  - cmdline: Mit binären Nullen getrenntes Array con Kommandozeile und -Argumenten
  - environ: Definition von Umgebungsvariablen
  - fd: Verzeichnis mit Links zu den offenen Filehandles des Prozesses
  - status: Systeminformationen zum Prozeß

# Einhängen des temporären Datenbaumes in die globale
# Hierarchie-Datenstruktur
#$h{"UNIX systems"}=\%d;
#%h=%d;
foreach $key (keys %d)
{
	$h{$key}=$d{$key};
}
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
