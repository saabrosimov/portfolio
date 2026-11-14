# 👨‍💻 Sergei Abrosimov — DevOps / SRE Portfolio


## 🚀 Проекты

### 📦 ya_practicum
Практические работы курса «DevOps-инженер» в Яндекс Практикуме.

| Проект | Описание | Технологии |
|--------|----------|------------|
| **[nginx-monitoring](./ya_practicum/nginx-monitoring)** | Полный стек наблюдаемости для Nginx: метрики, логи, алерты | Prometheus, Vector, Loki, Grafana Alerting |
| **compose/prom_grafana** | Мониторинг стека Prometheus + Grafana через Docker Compose | Docker Compose, Prometheus, Grafana |
| **compose/word_press** | Деплой WordPress с базой данных | Docker Compose, MySQL, WordPress |
| **compose/Gitea** | Локальный Git-сервер | Docker Compose, Gitea |
| **CI/CD** | Пайплайны непрерывной интеграции и доставки | GitLab CI / GitHub Actions |
| **IaC** | Инфраструктура как код | Terraform / OpenTofu, Ansible |

### 📦 OS_ALT / deploy_semaphore
Автоматизированный деплой Semaphore (CI/CD-сервер) с использованием Ansible и OpenTofu.

| Компонент | Назначение |
|-----------|------------|
| **playbooks/** | Ansible-плейбуки для конфигурации серверов |
| **templates/** | Шаблоны конфигураций (Jinja2) |
| **group_vars/** | Переменные групп хостов |
| **tofu/** | Инфраструктура через OpenTofu (Proxmox, локальные ресурсы) |


## 🛠 Технологии

- **Мониторинг:** Prometheus, Grafana, Loki, Vector, Alertmanager, node_exporter, nginx_exporter
- **Контейнеризация:** Docker, Docker Compose
- **CI/CD:** GitLab CI, GitHub Actions, Semaphore
- **IaC:** Terraform, OpenTofu, Ansible
- **Платформы:** Proxmox, Linux (Ubuntu/Debian), Windows
- **Языки:** Bash, YAML, HCL, Jinja2

---

## 📂 Структура репозитория

```text
portfolio/
├── OS_ALT/
│   └── deploy_semaphore/
│       ├── files/
│       ├── group_vars/
│       ├── playbooks/
│       ├── templates/
│       └── tofu/
└── ya_practicum/
    ├── CI/
    │   └── CD/
    ├── compose/
    │   ├── Gitea/
    │   ├── prom_grafana/
    │   └── word_press/
    ├── IaC/
    └── nginx-monitoring/
        ├── configs/
        ├── screenshots/
        └── README.md