# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

=================================
1. application creation


1. Users List View (Default View, route = /)
	A button to create new user - clicking on which user will be redirected to /new/ route
	Basic Table layout with all users
	Table should have 6 columns: #, Name, P5 balance, Reward balance, Login
	# - Static count number starting with 1
	Name - User's name
	P5 balance - self explanatory
	Reward balance - self explanatory
	Login - a edit button, clicking on which user will be redirected to /:id route
	Show each user in separate row

2. New User (route = /new)
	1 input for name
	Save button - saves the user, and redirects user back to list view, i.e. route /
	Cancel button - redirects user back to list view, i.e. route /

3. 