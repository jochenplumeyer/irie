#!/usr/bin/perl -w

use strict;
use YAML::XS;
use utf8;
my (%h, %d, $key, $this);

# Objekte für den Beginn sollen sein:
# Für UNIX-Systeme:
# 	Prozeß
# 	Befehl
# 	Verzeichnis
# 	Datei
# 
# Im OO-Sinn sind dies also Klassen, die realen Objekte werden aus ihnen
# instantiiert.
# Hier wird also Verallgemeinerung betrieben, das sollte sich auch mal
# in der Notation niederschlagen.

$d{"process"}{"meta"}{"name"}{"de"}="Prozeß";
$d{"process"}{"meta"}{"maincontext"}{"operating system"}="UNIX";
# Verbalisierung der Sätze:
# - Prozesse machen die eigentliche Arbeit eines Computers
# - hat eine eindeutige natürliche Zahl zugeordnet (also eine ID), die "process ID", ("pid").
# - bindet Ressourcen wie RAM, CPU, Dateien (handles und diskspace)
# - im Verzeichnis /proc/$pid befinden sich alle Informationen über den Prozeß
#   - exe: Pfad des gestarteten Programms
#   - cmdline: Mit binären Nullen getrenntes Array con Kommandozeile und -Argumenten
#   - environ: Definition von Umgebungsvariablen
#   - fd: Verzeichnis mit Links zu den offenen Filehandles des Prozesses
#   - status: Systeminformationen zum Prozeß
$d{"process"}{"pid"}=undef;
$d{"process"}{"exe"}=undef;
$d{"process"}{"cmdline"}=undef;
$d{"process"}{"environ"}=undef;
$d{"process"}{"fd"}=undef;
$d{"process"}{"status"}=undef;

$d{"file"}{"meta"}{"name"}{"de"}="Datei";
$d{"file"}{"meta"}{"maincontext"}{"operating system"}="UNIX";
$d{"file"}{"size"}=undef;
$d{"file"}{"basedir"}=undef;
$d{"file"}{"name"}=undef;
# Wenn ich eine Propagationsmaschine baue, brauche ich hier eine Liste
# von Abbildungen von verschiedenen Autoren basierend auf
# unterschiedlichen Laufzeitumgebungen.
#
# Notation für Graph-Knoten: $hierarchy.path.to.valuename 
# oder relative Notation:
# $this.valuename := $this.locator.valuename
# Instanzen/ Objekte könnten ein Array einer Klasse bilden, das über
# eine natürliche Zahl adressiert wird:
# $class.3.valuename := $this.locator.valuename
# keywords für den Parser wären dann also "this" und "locator",
# Variablen würden mit "$" erkannt.
# Ohne "$" würde ich später vermutlich in Konflikte geraten.
$d{"file"}{"fullname"}="append($this.basedir,$this.name)";

$d{"directory"}{"meta"}{"name"}{"de"}="Verzeichnis";
$d{"directory"}{"meta"}{"maincontext"}{"operating system"}="UNIX";
$d{"directory"}{"basedir"}=undef;

$d{"command"}{"meta"}{"name"}{"de"}="Befehl";
$d{"command"}{"meta"}{"maincontext"}{"operating system"}="UNIX";
$d{"command"}{"fullpath"}=undef;
$d{"command"}{"environ"}=undef;
$d{"command"}{"argument array"}=undef;


# Einhängen des temporären Datenbaumes in die globale
# Hierarchie-Datenstruktur
foreach $key (keys %d)
{
	my @a =keys %{$d{$key}{"meta"}{"maincontext"}};
	$h{$a[0]}{$d{$key}{"meta"}{"maincontext"}{$a[0]}}{$key}=$d{$key};
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

YAML::XS::DumpFile("/tmp/irie.yaml", \%h);
