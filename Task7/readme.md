## Exadel sandbox Task 7

- Zabbix
actions done:
1. Prepare 1 instance for installing zabbix and 2 more instances with apache and nginx for monitoring, configure security groups
2. Install zabbix 6.0 LTS according to official documentation
3. Install zabbix agents on prepared instances
4. Add these instances to Configuration-hosts
5. Created some active and passive checks, like CPU load, system uptime, ping, service status
6. Set up my own dashboard with monitoring of my instances
![Result](https://github.com/alex-punkster/exadel_sandbox/blob/master/Task7/img/zabbix.png?raw=true)

- ELK
actions done:
1. Prepare VM with Ubuntu 20.04 on my PC
2. Prepare a docker-compose file which include: elasticsearch, logstash, kibana
3. Configure Kibana in web GUI for log collection
![Result](https://user-images.githubusercontent.com/98597318/158998707-b5248834-5265-4440-9f9f-3c12eb566bd3.png)
4. Modified my docker-compose file adding Metricbeat feature for getting metrics from my running containers. Configure Metricbeat in Web GUI. Run some containers attached to metricbeat. Run `make start-monitoring` for getting data
![Result](https://github.com/alex-punkster/exadel_sandbox/blob/master/Task7/img/kibana.png?raw=true)

- Grafana
actions done:
1. Modify my docker-compose file adding Grafana installation section
2. Run Grafana in web browser, add data source - elasticsearch
3. Set up my own dashboard in grafana
![Result](https://github.com/alex-punkster/exadel_sandbox/blob/master/Task7/img/grafana.png?raw=true)
