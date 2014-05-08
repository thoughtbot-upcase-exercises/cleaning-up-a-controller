# "Cleaning Up a Controller" Exercise

In this exercise, you'll be cleaning up controller called
`ExpensesController`. This controller can do a few things:

* List out existing expenses for a user
* Filter expenses by amount and approval status
* Create a new expense
* Email an admin after expenses are created
* Change name or amount unapproved expenses
* Delete expenses from the database

## Exercise!

Before you get started, make sure you run `./bin/setup` to install gems
and set up your database.

You're going to want to do a few things to the existing controller code:

* All public methods should be as RESTful as possible
* Make sure the only logic that lives in your controller is related to handling
your requests and responses
* Apply other techniques from previous exercises and tutorials to clean up this
controller as much as possible

Test any new classes you write for this exercise.

Make sure all tests are passing by running:

`rake`
