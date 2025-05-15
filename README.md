
# Chefs & Recipes App

## Особенности

- Ruby **3.4.\***
- Rails **7.0.\***
- PostgreSQL
- JavaScript-фреймворк **Stimulus** через `importmap`

## Модели

### Chef

- `name` — имя повара
- `bio` — краткая биография
- `has_many :recipes`

### Recipe

- `name` — название рецепта
- `ingredients` — ингредиенты
- `instructions` — инструкция
- `belongs_to :chef`

## Функциональность

- Полноценный CRUD для `Chef` и `Recipe`
- Валидации в моделях
- Страница списка поваров с возможностью поиска (Stimulus + AJAX)
- Вывод flash-сообщений и их автоматическое закрытие (Stimulus)
- Динамическое обновление таблицы поваров через Stimulus-контроллер

## Stimulus

Используется Stimulus-контроллер `search_controller.js`:

- Поиск поваров без перезагрузки страницы
- Динамический рендер таблицы результатов

Автоматическое закрытие flash-сообщений

## Установка

```bash
bundle install
bin/rails db:create db:migrate db:seed
rails s
```
