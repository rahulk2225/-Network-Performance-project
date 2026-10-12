create database network;
use network;
create table network_logs (
    timestamp DATETIME,
    node VARCHAR(100),
    latency_ms DECIMAL(10,2),
    packet_loss_pct DECIMAL(10,2)
);
create table summary_hourly (
    hour INT,
    is_degraded DECIMAL(10,6)
);
create table summary_weekday_hour (
    weekday VARCHAR(20),
    hour INT,
    is_degraded DECIMAL(10,6)
);
create table summary_node_hour (
    node VARCHAR(100),
    hour INT,
    is_degraded DECIMAL(10,6)
);
SELECT COUNT(*) FROM network_logs;
SELECT * FROM network_logs LIMIT 10;
SELECT * FROM summary_hourly;
SELECT * FROM summary_weekday_hour LIMIT 10;
SELECT * FROM summary_node_hour LIMIT 10;
SELECT node,COUNT(*) AS records,ROUND(AVG(latency_ms),2) AS avg_latency_ms,ROUND(AVG(packet_loss_pct),2) AS avg_packet_loss_pct
FROM network_logs
GROUP BY node
ORDER BY avg_latency_ms DESC;
SELECT * FROM network_logs
ORDER BY latency_ms DESC
LIMIT 10;
SELECT * FROM network_logs
ORDER BY packet_loss_pct DESC
LIMIT 10;
SELECT node,ROUND(AVG(latency_ms),2) AS avg_latency,ROUND(AVG(packet_loss_pct),2) AS avg_packet_loss
FROM network_logs
GROUP BY node
ORDER BY avg_latency DESC;
SELECT node,MAX(is_degraded) AS max_degradation
FROM summary_node_hour
GROUP BY node
ORDER BY max_degradation DESC;
SELECT hour,is_degraded FROM summary_hourly
ORDER BY is_degraded DESC;
SELECT hour,is_degraded FROM summary_hourly
ORDER BY is_degraded DESC
LIMIT 5;
SELECT weekday,hour,is_degraded
FROM summary_weekday_hour
ORDER BY is_degraded DESC
LIMIT 10;
