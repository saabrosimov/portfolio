\# 👨‍💻 Sergei Abrosimov — DevOps / SRE Portfolio



Добро пожаловать в моё портфолио! Здесь собраны практические работы по DevOps, SRE и инфраструктурным практикам: от настройки CI/CD и контейнеризации до построения полных стеков наблюдаемости.





\## 🚀 Проекты



\### 📦 ya\_practicum

Практические работы курса «DevOps-инженер» в Яндекс Практикуме.



| Проект | Описание | Технологии |

|--------|----------|------------|

| \*\*\[nginx-monitoring](./ya\_practicum/nginx-monitoring)\*\* | Полный стек наблюдаемости для Nginx: метрики, логи, алерты | Prometheus, Vector, Loki, Grafana Alerting |

| \*\*compose/prom\_grafana\*\* | Мониторинг стека Prometheus + Grafana через Docker Compose | Docker Compose, Prometheus, Grafana |

| \*\*compose/word\_press\*\* | Деплой WordPress с базой данных | Docker Compose, MySQL, WordPress |

| \*\*compose/Gitea\*\* | Локальный Git-сервер | Docker Compose, Gitea |

| \*\*CI/CD\*\* | Пайплайны непрерывной интеграции и доставки | GitLab CI / GitHub Actions |

| \*\*IaC\*\* | Инфраструктура как код | Terraform / OpenTofu, Ansible |



\### 📦 OS\_ALT / deploy\_semaphore

Автоматизированный деплой Semaphore (CI/CD-сервер) с использованием Ansible и OpenTofu.



| Компонент | Назначение |

|-----------|------------|

| \*\*playbooks/\*\* | Ansible-плейбуки для конфигурации серверов |

| \*\*templates/\*\* | Шаблоны конфигураций (Jinja2) |

| \*\*group\_vars/\*\* | Переменные групп хостов |

| \*\*tofu/\*\* | Инфраструктура через OpenTofu (Proxmox, локальные ресурсы) |



\---



\## 🛠 Технологии



\- \*\*Мониторинг:\*\* Prometheus, Grafana, Loki, Vector, Alertmanager, node\_exporter, nginx\_exporter

\- \*\*Контейнеризация:\*\* Docker, Docker Compose

\- \*\*CI/CD:\*\* GitLab CI, GitHub Actions, Semaphore

\- \*\*IaC:\*\* Terraform, OpenTofu, Ansible

\- \*\*Платформы:\*\* Proxmox, Linux (Ubuntu/Debian), Windows

\- \*\*Языки:\*\* Bash, YAML, HCL, Jinja2



\---



\## 📂 Структура репозитория



```text

portfolio/

├── OS\_ALT/

│   └── deploy\_semaphore/

│       ├── files/

│       ├── group\_vars/

│       ├── playbooks/

│       ├── templates/

│       └── tofu/

└── ya\_practicum/

    ├── CI/

    │   └── CD/

    ├── compose/

    │   ├── Gitea/

    │   ├── prom\_grafana/

    │   └── word\_press/

    ├── IaC/

    └── nginx-monitoring/

        ├── configs/

        ├── screenshots/

        └── README.md

