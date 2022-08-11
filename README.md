# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby 2.6.0p0 (2018-12-25 revision 66547) [x86_64-darwin21]

* Rails version
  Rails 5.2.8.1

* Database creation
  Postgress has been used in this project,new DB can be created by using rails db:create after using rails db:drop,
  running rails db:migrate after creation of database is must to do.

* Database initialization
  Database can be initialized by running rails db:seed

* Services (job queues, cache servers, search engines, etc.)
  Background job has been set to delete the stories after 24 hours.


* Deployment instructions
  You can deploy your application on Heroku using the following commands.
  heroku login
  heroku create
  heroku rename//(If you want to rename your application on Heroku)
  git push heroku main
  heroku run rails db:migrate

* ...
