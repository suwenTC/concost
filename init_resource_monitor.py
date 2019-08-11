import os
import sys, socket

def writePrometheusConfigFile(name, yml):
    f = open("/opt/prometheus/" + name, "w")
    f.write(yml)
    f.close()

os.system("docker pull prom/node-exporter")
os.system("docker pull google/cadvisor")
os.system("docker pull prom/prometheus")
os.system("docker pull grafana/grafana")

os.system('docker run -d -p 9100:9100 \
  -v "/proc:/host/proc:ro" \
  -v "/sys:/host/sys:ro" \
  -v "/:/rootfs:ro" \
  --net="host" \
  prom/node-exporter')

os.system('docker run \
    -v "/:/rootfs:ro" \
    -v "/var/run:/var/run:ro" \
    -v "/sys:/sys:ro" \
    -v "/var/lib/docker/:/var/lib/docker:ro" \
    -v "/dev/disk/:/dev/disk:ro" \
    -p 8080:8080 \
    --detach=true \
    --name=cadvisor \
    google/cadvisor:latest')


os.system("mkdir /opt/prometheus")
os.system("touch /opt/prometheus/prometheus.yml")


prometheus = """
global:
  scrape_interval:     10s
  evaluation_interval: 10s
 
scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets: ['%(ip)s:9090']
        labels:
          instance: prometheus
 
  - job_name: cadvisor
    static_configs:
      - targets: ['%(ip)s.168.91.132:8080']
        labels:
          instance: cadvisor
""" % dict(ip=sys.argv[1])

writePrometheusConfigFile("prometheus.yml", prometheus)

os.system('docker run -d -p 9090:9090 \
  -v "/opt/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml" \
  prom/prometheus')

os.system("mkdir /opt/grafana-storage")
os.system("chmod 777 -R /opt/grafana-storage")

os.system('docker run -d \
  -p 3000:3000 \
  --name=grafana \
  -v "/opt/grafana-storage:/var/lib/grafana" \
  grafana/grafana')
