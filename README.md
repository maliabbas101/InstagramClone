# Instagram Clone

This is an Instagram Clone web application, which is developed using Ruby on Rails.

Users can login/signup and upload Posts and Stories while interacting with other users, It provides the functionality of making Private or Public Account.


## Versions Used
* Ruby version
  ruby 2.6.0p0 (2018-12-25 revision 66547) [x86_64-darwin21]
* Rails version
  Rails 5.2.8.1

### Dependencies
* Pundit
* Devise
* Cloudinary
* pg

### Database Creation
Postgress has been used in this Project, new database can be created using following commands.

```bash
rails db:drop
rails db:create
rails db:migrate
```

### Database Initialization
Database can be initialized by running.

```bash
rails db:seed
```
### Background Jobs
User stories will be automatically deleted, as I have setup the background job using sidekiq.

### Deployment Instructions

```bash
heroku login
heroku create #This will create new application.
heroku rename #If you want to rename your application.
git push heroku main
heroku run rails db:migrate
```
## Web-Application Link
[Instagram Clone](https://instagram-clone07.herokuapp.com/)
