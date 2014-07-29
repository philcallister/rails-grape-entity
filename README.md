# Todo API

This is an example application showing how to use
[grape](https://github.com/intridea/grape) to create a simple API using
entities with the [grape-entity](https://github.com/intridea/grape-entity) gem.
This sample shows how to create a simple API without authentication, caching, etc.
It also only shows GET requests.  It doesn't update or delete any information.  I
plan to add a few examples, but this is really just to show how Grape + Grape-Entity
work together.

## Environment

The sample was developed using the following 

1. Rails 4.1.4
2. ruby 2.1.0p0
3. OS X 10.9.4
4. Grape (0.8.0) 
5. Grape Entity (0.4.3) 

## Setup

Gem installation

```bash
bundle install
```

Create and migrate

```bash
rake db:migrate
```

Seed data

```bash
rake db:seed
```

## Testing

```bash
bundle exec rspec spec
```

## Run It

start the Rails server

```bash
rails s
```

## Usage

Getting all todos

```bash
curl -i http://localhost:3000/api/v1/todos
```

Getting all todos (include todo items)

```bash
curl -i http://localhost:3000/api/v1/todos?type=all
```

Getting a single todo

```bash
curl -i http://localhost:3000/api/v1/todos/1
```

Getting a single todo (include todo items)

```bash
curl -i http://localhost:3000/api/v1/todos/1?type=all
```

Getting the items for a todo

```bash
curl -i http://localhost:3000/api/v1/todos/1/items
```

Failure to get an item

```bash
curl -i http://localhost:3000/api/v1/items/999
```
