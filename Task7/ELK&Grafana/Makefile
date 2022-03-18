#MONITORING
create-network:
	@docker network create metricbeat || true
remove-network:
	@docker network rm metricbeat

start-monitoring: create-network start-elasticsearch start-kibana
	@docker-compose up -d metricbeat
	@echo "Monitoring STARTED"

stop-monitoring: stop-metricbeat
	@docker-compose stop
	@echo "Monitoring STOPPED"

build:
	@docker-compose build

#MYSQL
compose-mysql=docker-compose -f docker-compose.mysql.yml -p metricbeat_mysql
start-mysql:
	@$(compose-mysql) up -d mysql
stop-mysql:
	@$(compose-mysql) stop mysql

#REDIS
compose-redis=docker-compose -f docker-compose.redis.yml -p metricbeat_redis
start-redis:
	@$(compose-redis) up -d redis
stop-redis:
	@$(compose-redis) stop redis


#APACHE
compose-apache=docker-compose -f docker-compose.apache.yml -p metricbeat_apache
start-apache:
	@$(compose-apache) up -d apache
stop-apache:
	@$(compose-apache) stop apache


start-all: start-apache start-redis start-mysql

stop-all: start-apache start-redis start-mysql


