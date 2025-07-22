# Variáveis
PYTHON=python3
DOCKER_COMPOSE=docker-compose
ENV_FILE=.env
PCAP_DIR=modules/00-pcap-forensics/sample-pcaps
SCRIPT_DIR=scripts
TEST_DIR=tests

# Inicializa stack docker
up:
	$(DOCKER_COMPOSE) up -d

# Para os containers
down:
	$(DOCKER_COMPOSE) down

# Reinicia os containers
restart:
	$(DOCKER_COMPOSE) restart

# Faz build dos containers
build:
	$(DOCKER_COMPOSE) up -d --build

# Limpa containers, volumes e cache
clean:
	$(DOCKER_COMPOSE) down -v --remove-orphans
	docker system prune -f

# Executa análise de um pcap com Zeek e Suricata
analyze:
	@echo ">> Rodando análise com Zeek e Suricata"
	sudo zeek -r $(PCAP_DIR)/sample.pcap -C
	sudo suricata -r $(PCAP_DIR)/sample.pcap -l output/

# Roda os scripts de parsing
parse:
	$(DOCKER_COMPOSE) exec filebeat filebeat setup


# Ajuda
help:
	@echo "Comandos disponíveis:"
	@echo "  up          - Sobe containers Docker"
	@echo "  down        - Derruba containers"
	@echo "  restart     - Reinicia containers"
	@echo "  build       - Builda containers"
	@echo "  clean       - Remove containers, volumes e cache"
	@echo "  analyze     - Roda Suricata e Zeek nos pcaps"
	@echo "  parse       - Executa scripts de parsing"
	
