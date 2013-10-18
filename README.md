Conference Track Management.
===========================

Written by (http://www.linkedin.com/in/russelladcock/ "Russell Adcock")

Overview
--------

This is a Ruby on Rails application that accepts an input file of unorganised list of conference talks and creates an organised conference schedule.
BDD and TDD were heavily used in the design of this application, the BDD Scenarios were developed from the requirements,

The only libraries used to produce this application were

* Rails
* Rake
* Cucumber

Assumptions
-----------

* Rails version 3.2.13
* Ruby version 1.9.3

Run Instructions
----------------

1. cd conference_track_management
2. bundle install
3. rake db:migrate
4. rake test
5. rake cucumber
6. rails server