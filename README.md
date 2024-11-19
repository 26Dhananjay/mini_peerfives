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
Building a Mini Peerfives application in Rails involves several steps. Below, I’ve detailed the process:

## 1. Set Up Rails Application
	# Install Ruby and Rails (ensure you have Ruby >= 3.0.0 and Rails >= 7.0.0).
	# Install PostgreSQL or MySQL (or your preferred database).
	# Create a new Rails application:
	
	 	rails new mini_peerfives --database=mysql
		cd mini_peerfives

	# Configure the database in config/database.yml and run
		rails db:create

	# Generate Models and Migrations
		rails g model User name:string p5_balance:integer reward_balance:integer
		rails g model RewardHistory datetime:datetime points:integer given_by:integer given_to:integer
		rails db:migrate

	# Generate Controllers
		rails g controller Users
		rails g controller RewardHistories

	# Routes Configuration

	# Create Views for users and rewards

	# Implement the rewards and balance logic and delete transaction logic.

	# Test the application on localhost
		rails s

## 2. Problem Statements Covered 

1. ## Users List View (Default View, route = /) =========== [COMPLETED]
	A button to create new user - clicking on which user will be redirected to /new/ route
	Basic Table layout with all users
	Table should have 6 columns: #, Name, P5 balance, Reward balance, Login
	# - Static count number starting with 1
	Name - User's name
	P5 balance - self explanatory
	Reward balance - self explanatory
	Login - a edit button, clicking on which user will be redirected to /:id route
	Show each user in separate row

2. ## New User (route = /new)  =========== [COMPLETED]
	1 input for name
	Save button - saves the user, and redirects user back to list view, i.e. route /
	Cancel button - redirects user back to list view, i.e. route /

3. ## View User (route = /:id)  =========== [COMPLETED]
	Show a form with user details
	Re-use the same component from New User
	Pre-fill the name from the existing user
	Save button - saves the user
	a button with text which shows logged in user's P5 balance, click on which user will be redirected to /:id/p5 route
	a button with text which shows logged in user's Reward balance, click on which user will be redirected to /:id/rewards route

4. ## P5 History (route = /:id/p5)  =========== [COMPLETED]
	A button to create new reward - clicking on which user will be redirected to /:id/rewards/new route
	Show P5 balance
	Basic Table layout with all P5 history
	Table should have 6 columns: #, Date-Time, P5 given, User Name, Delete
	# - Static count number starting with 1
	Date-Time - self explanatory
	P5 given - self explanatory
	User Name - name of user to whom P5 were given
	Delete - a delete button which will reverse the P5 given
	Show each P5 in separate row

5. ## Reward History (route = /:id/rewards)  =========== [COMPLETED]
	Show Rewards balance
	Basic Table layout with all Rewards history
	Table should have 6 columns: #, Date-Time, Rewards received, User Name
	# - Static count number starting with 1
	Date-Time - self explanatory
	Rewards received - self explanatory
	User Name - name of user who gave rewards
	Show each Reward in separate row

6. ## New Reward (route = /:id/rewards/new)  =========== [COMPLETED]
	Basic Form layout to create a new reward
	A dropdown with list of all users, except self
	An numeric input with validation of max limit set to 100
	Below input, show how much P5 balance user have
	A submit button
	Clicking on which will create a new reward (deduct P5 from current user and transfer to awardee)
	Button should be disabled if user enters more than 100 in numeric input or if not sufficient balance
	After successful submission, user will be redirected back back
	A cancel button, click on which user will be redirected back
