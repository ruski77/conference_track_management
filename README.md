Conference Track Management.
===========================

Written by Russell Adcock

http://www.linkedin.com/in/russelladcock/

Overview
--------

This is a Ruby on Rails application that accepts an input file of unorganised list of conference talks and creates an organised conference schedule.
BDD and TDD were heavily used in the design of this application, the BDD Scenarios were developed from the requirements,
the unit tests were development to meet the acceptance criteria of the BDD Scenarios.

The libraries used to produce this application were

* rails
* rake
* cucumber
* sqlite3
* database_cleaner

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
7. Open your browser and navigation to http://localhost:3000/