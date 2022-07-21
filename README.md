# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version '2.7.0'

* Rails version '6.1.6'

* Database postgresql

* System dependencies

* Run project:
```
- bundle install --path ./vendor/bundle
- docker-compose up -d
- rails db:create
- rails db:migrate
- rails db:seed_fu
  if errors run: 
    - rails db:seed_fu FILTER=user
    - rails db:seed_fu FILTER=category
    - rails db:seed_fu FILTER=product
    - rails db:seed_fu FILTER=delivery_address
- ./bin/webpack-dev-server
- rails s
```

