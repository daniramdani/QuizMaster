# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    ruby 2.3.1p112

* Frontend
    ReactJS

* Setup Application
  (Using RVM)
  1. Pull Source Code from GitHUB

  2. Install Ruby : 
       rvm install ruby 2.3.1p112

  3. Set Installed Ruby :
       rvm use ruby 2.3.1p112

  4. Create Gemset : 
       rvm gemset create [name of gemset] 

  5. Set Gemset : 
       rvm gemset use [name of gemset]

  6. Install bundler : 
       gem install bundler

  7. Install gem dependency : 
       bundle install

  8. Create Database : 
       rake db:create:all

  9. Create Tables :
       rake db:migrate

 10. Start Application :
       rails server


* How to run the test suite
    rspec spec



