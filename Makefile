all: up

up: 
	rsync -av /home/jochen/irie jochen@plumeyer.org:irie/git/
