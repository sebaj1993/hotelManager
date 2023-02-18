# README

## HotelManager

* Ruby version: 
    ruby 3.1.2

* Configuration:
  - mongoid was configured so that when it doesn't find a document it doesn't raise an error

* Database:
    This project uses MongoDB as the database and Mongoid as the ORM.

    * MongoDB version: [6.0.4]

* Database initialization:
  - Check that your mongo database is active, you can do this with the command, `sudo systemctl status mongod`
      if it is not active you can start it with the command `sudo systemctl start mongod`

* How to run the test suite:
    With the command `rails test`

* Deployment instructions:
    - Install the gems used by the project with the command `bundle install`
    - Check that your mongo database is active
    - Run the server with the command `rails server`
