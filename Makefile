all: Parser.yp test

clean:
	rm -f parser.pl test.yaml

parser.pl: Parser.yp
	yapp -b '/usr/bin/perl -w' -s -o parser.pl Parser.yp
	
test: parser.pl
#	echo "-9 should be the following output."
#	echo "(1+2)*-3" | perl parser.pl
#	echo "sin(1)" | perl parser.pl
#	echo 'a="bla"' | perl parser.pl
#	echo 'a="bla \"with\" quoted \"strings\""' | perl parser.pl
#	egrep -v ^# ../archaic-ontology.irie  | perl parser.pl
#	perl parser.pl < ../test.irie
#	perl parser.pl < tests/abc.irie
#	perl parser.pl < tests/strings.irie
#	perl parser.pl < tests/simpleterms.irie
#	perl parser.pl < tests/archaic-defs-without-units.irie
	perl parser.pl < tests/db-start.irie

up: 
	rsync -av /home/jochen/irie/parser jochen@plumeyer.org:irie/

.phony: clean test
