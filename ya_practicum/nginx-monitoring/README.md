## Краткое резюме 

Развернуть полный цикл наблюдаемости (Observability) для Nginx-сервера: сбор метрик, парсинг логов, визуализация и проактивный алертинг с доставкой уведомлений на Email.

## Стек

- **Метрики:** Prometheus, Node Exporter, Nginx Prometheus Exporter
- **Логи:** Vector (сбор и парсинг), Grafana Loki (хранение)
- **Визуализация и алертинг:** Grafana (встроенный Alerting, SMTP)

### 1. Сбор метрик

- Установлен `node_exporter` (порт 9100) для системных метрик
- Установлен `nginx-prometheus-exporter` (порт 9113) с интеграцией `stub_status`
- Настроен `prometheus.yml` с `scrape_configs` для обоих экспортеров

### 2. Сбор и парсинг логов

- Развернут Vector для чтения `/var/log/nginx/access.log` и `error.log`
- Настроен VRL для добавления поля `.log_type` (access/error)
- Сконфигурирован Sink в Loki с метками `job="vector"` и `log_type`

### 3. Визуализация (Дашборд "Nginx Overview")

1. **Nginx Status** — статус экспортера (Stat, 1=Green, 0=Red)
2. **CPU Load** — загрузка CPU (PromQL)
3. **RAM Usage** — использованная память (bytes IEC)
4. **RPS** — запросы в секунду (`rate(nginx_http_requests_total[1m])`)
5. **Error Logs** — логи ошибок из Loki
6. **Top 10 IPs** — круговая диаграмма активных клиентов

### 4. Алертинг (Grafana Alerting)

- Настроен SMTP для Email-уведомлений
- Создан Contact Point с успешным тестом доставки
- Правило **NginxDown**: `nginx_up == 0` в течение 1m
- Правило **InstanceDown**: `up{job="node_exporter"} != 1` в течение 2m

## Тестирование

- Остановка Nginx → алерт Firing → Email уведомление
- Остановка node_exporter → алерт Firing → Email уведомление
- Генерация нагрузки (200 запросов + 30 ошибок 404) → рост RPS, логи ошибок, IP в Top 10

## Скриншоты

- `01_alert_rules.png` — список правил алертинга
- `02_nginx_up.png` — Nginx работает (Normal)
- `03_Instance_up.png` — node_exporter работает (Normal)
- `04_nginx_down.png` — алерт NginxDown в состоянии Firing
- `05_email_nofication_nginx_down2.png` — Email уведомление о падении Nginx
- `06_instance_down.png` — алерт InstanceDown в состоянии Firing
- `07_dashboard_load.png` — дашборд во время тестовой нагрузки
- `08_email_notification_nginx_down.png` — Email уведомление о падении Nginx
- `09_email_notification_instance_down.png` — Email уведомление о падении node_exporter

## Структура репозитория

```text
.
├── configs/
│   ├── prometheus.yml
│   ├── vector.yaml
│   └── loki-config.yml
├── screenshots/
│   ├── 01_alert_rules.png
│   ├── 02_nginx_up.png
│   ├── 03_Instance_up.png
│   ├── 04_nginx_down.png
│   ├── 05_email_nofication_nginx_down2.png
│   ├── 06_instance_down.png
│   ├── 07_dashboard_load.png
│   ├── 08_email_notification_nginx_down.png
│   └── 09_email_notification_instance_down.png
└── README.md
