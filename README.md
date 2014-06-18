# YmNotifications

## Installation

Add to your Gemfile
```
gem 'ym_notificationss'
```
run the install generator,
```
rails generate ym_permalinks:install
```
if you have not installed ym_users before,
```
rails generate ym_users:install
```
then migrate.
```
rake db:migrate
```
Include the styles
**application.css.scss**
```
*= require ym_notifications
```

## Tests
To run the tests
```
 rake -f test/dummy/Rakefile db:drop db:create db:migrate test:prepare
 rspec
 cucumber
```
