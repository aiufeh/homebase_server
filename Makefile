CC     = go
BLD    = build
SRCDIR = ./cmd/server/
SRC    = main.go

DBPW     = password
DB       = innovision
DBUSR    = ip
DBPORT   = 3306
SCHEMA   = ./init/schema.sql
DEMODATA = ./init/demodata.sql

BINDIR = ./bin/
EXEC   = homeserver

CONFIG = ./init/config.json

build:
	@mkdir -p $(BINDIR)
	$(CC) $(BLD) -o $(BINDIR)$(EXEC) $(SRCDIR)$(SRC)

run:
	@$(BINDIR)$(EXEC) -config=$(CONFIG)

init-database:
	mysql -h 127.0.0.1 -P $(DBPORT) --protocol=tcp -u $(DBUSR) --password=$(DBPW) -D $(DB) < $(SCHEMA)

demodata:
	mysql -h 127.0.0.1 -P $(DBPORT) --protocol=tcp -u $(DBUSR) --password=$(DBPW) -D $(DB) < $(DEMODATA)

connect:
	mysql -h 127.0.0.1 -P $(DBPORT) --protocol=tcp -u $(DBUSR) --password=$(DBPW) -D $(DB)
