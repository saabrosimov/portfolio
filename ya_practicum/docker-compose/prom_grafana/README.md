# 📊 Мониторинговая система Prometheus + Grafana

## 📋 Описание

Проект демонстрирует развёртывание стека мониторинга на базе **Prometheus** и **Grafana** с использованием Docker Compose. Система автоматически собирает метрики и визуализирует их через веб-интерфейс Grafana с предустановленным источником данных.

### 🎯 Цели проекта
- Настройка контейнеризированной системы мониторинга
- Автоматическая конфигурация источников данных в Grafana через provisioning
- Использование именованных томов и bind mounts для персистентности данных

## 🛠 Технологический стек

- **Docker** & **Docker Compose** — контейнеризация
- **Prometheus v3.4.1** — система сбора метрик
- **Grafana v12.0.2** — система визуализации и дашбордов

## 📁 Структура проекта

```
.
├── compose.yml              # Оркестрация контейнеров
├── prometheus.yml           # Конфигурация Prometheus
├── grafana/
│   └── datasources.yml      # Автоматическая настройка datasource в Grafana
└── .env                     # Переменные окружения (опционально)
```

## 🚀 Быстрый старт

- Docker Engine 20.10+
- Docker Compose v2.0+

### Установка и запуск

```bash
# Клонируйте репозиторий
git clone <your-url>
cd ya_practicum

# Запустите контейнеры
docker compose up -d

# Проверьте статус
docker compose ps
```

### Доступ к сервисам

| Сервис | URL | Описание |
|--------|-----|----------|
| **Grafana** | http://localhost:3001 | Веб-интерфейс (логин: `admin`, пароль: `admin`) |
| **Prometheus** | http://localhost:9090 | UI Prometheus |


## 📚 Ключевые навыки

✅ Контейнеризация приложений с Docker  
✅ Оркестрация multi-container приложений через Docker Compose  
✅ Работа с именованными томами (named volumes) для персистентности  
✅ Bind mounts для конфигурационных файлов  
✅ Автоматический provisioning в Grafana  
✅ Network configuration в Docker  
✅ Troubleshooting Docker ошибок  

## 🔗 Полезные ссылки

- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Prometheus Documentation](https://prometheus.io/docs/)
- [Grafana Provisioning](https://grafana.com/docs/grafana/latest/administration/provisioning/)

## 📝 Лицензия

Учебный проект, выполненный в рамках курса Яндекс Практикум.
