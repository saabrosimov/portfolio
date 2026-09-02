# 🌐 WordPress + MySQL с Docker Secrets

## 📋 Описание

Проект демонстрирует развёртывание  **WordPress** и **MySQL**. Задача заключалась в запуске исходной конфигурации и исправлении допущенных в ней ошибок.

### 🎯 Цели
- Развёртывание WordPress с MySQL в Docker Compose
- Использование Docker Secrets для безопасной передачи паролей
- Анализ и исправление ошибок в конфигурации


## 🛠 Технологический стек

- **Docker** & **Docker Compose** — контейнеризация и оркестрация
- **WordPress 6.8.1** — CMS для управления контентом
- **MySQL 9.3.0** — реляционная СУБД

## 📁 Структура

```
word_press/
├── compose.yml              # Оркестрация контейнеров
├── .env                     # Переменные окружения
├── db_password.txt          # Пароль пользователя БД
├── db_root_password.txt     # Root-пароль MySQL
└── .gitignore               # Исключения для Git
```

## 🚀 Быстрый старт

### Предварительные требования
- Docker Engine 20.10+
- Docker Compose v2.0+
- Свободный порт `8000` на хосте

### Установка и запуск

```bash
# Клонируйте репозиторий
git clone <your-url>
cd word_press

# Создайте файлы с паролями
echo "my_secure_password" > db_password.txt
echo "my_root_password" > db_root_password.txt

# Создайте .env файл

MYSQL_ROOT_PASSWORD_FILE=/run/secrets/db_root_password
MYSQL_DATABASE=wordpress
MYSQL_USER=wordpress
MYSQL_PASSWORD_FILE=/run/secrets/db_password
WORDPRESS_DB_HOST=db:3306
WORDPRESS_DB_USER=wordpress
WORDPRESS_DB_PASSWORD_FILE=/run/secrets/db_password

# Запустите контейнеры
docker compose up -d

# Проверьте статус
docker compose ps
```

### Доступ к сервисам

| Сервис | URL | Описание |
|--------|-----|----------|
| **WordPress** | http://localhost:8000 | Веб-интерфейс CMS |

После запуска откройте `http://localhost:8000` — появится страница установки WordPress.

## ⚙️ Конфигурация

### Docker Compose (`compose.yml`)

**Сервис MySQL:**
- Образ: `mysql:9.3.0`
- Именованный том `db_data` для персистентности данных
- Секреты: `db_password` и `db_root_password`
- Переменные окружения из `.env`

**Сервис WordPress:**
- Образ: `wordpress:6.8.1`
- Порт: `8000:80`
- Зависимость от MySQL через `depends_on`
- Секрет: `db_password`

### Docker Secrets

Секреты передаются через файлы:
- `db_password.txt` → монтируется как `/run/secrets/db_password`
- `db_root_password.txt` → монтируется как `/run/secrets/db_root_password`

Это безопаснее, чем передача паролей через переменные окружения, так как:
- Секреты не попадают в логи контейнеров
- Файлы секретов монтируются в tmpfs (в памяти)
- Нет риска утечки через `docker inspect`

## 🐛 Решённые проблемы

### Ошибка 1: Отсутствие секрета `db_root_password` в сервисе `db`

**Исходная конфигурация:**
```yaml
services:
  db:
    environment:
      MYSQL_ROOT_PASSWORD_FILE: /run/secrets/db_root_password
    secrets:
      - db_password  #  Отсутствует db_root_password
```

**Проблема:** В `environment` указан путь `/run/secrets/db_root_password`, но в списке `secrets` этот секрет не подключён. Docker не смонтирует файл секрета в контейнер, и MySQL не сможет прочитать root-пароль.

**Исправление:**
```yaml
services:
  db:
    environment:
      MYSQL_ROOT_PASSWORD_FILE: /run/secrets/db_root_password
    secrets:
      - db_password
      - db_root_password  #  Добавлен недостающий секрет
```


### Ошибка 2: Неверное имя секрета в сервисе `wordpress`

**Исходная конфигурация:**
```yaml
services:
  wordpress:
    secrets:
      - db_password.txt  #  Неправильно — это имя файла
```

**Проблема:** В списке `secrets` указано `db_password.txt` (имя файла на хосте), но Docker Compose ожидает имя секрета из корневой секции `secrets` — `db_password`.

**Исправление:**
```yaml
services:
  wordpress:
    secrets:
      - db_password  #  Правильно — имя секрета из корневой секции
```

## 🔐 Важное замечание о безопасности

⚠️ **В этом учебном проекте файлы с паролями (`db_password.txt`, `db_root_password.txt`) и `.env` добавлены в `.gitignore` и не коммитятся в репозиторий.**

В реальных production-средах рекомендуется:
- Использовать **Docker Swarm Secrets** или **Vault** для управления секретами
- Никогда не хранить пароли в репозитории
- Использовать переменные окружения только для неконфиденциальных данных
- Регулярно ротировать секреты

**В данном проекте файлы с паролями оставлены намеренно для демонстрации работы Docker Secrets в учебной среде.**

## 📚 Ключевые навыки

✅ Работа с Docker Secrets для безопасной передачи конфиденциальных данных  
✅ Оркестрация multi-container приложений через Docker Compose  
✅ Использование `.env` для управления конфигурацией  
✅ Понимание разницы между именами файлов и именами секретов  
✅ Настройка персистентности данных через именованные тома  
✅ Troubleshooting Docker: анализ ошибок конфигурации  
✅ Best practices безопасности: изоляция секретов от репозитория  

## 📝 Лицензия

Учебный проект, выполненный в рамках курса Яндекс Практикум.
