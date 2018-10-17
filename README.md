# Refactoring / Cleaning Up A Controller

Hey there! We're [thoughtbot](https://thoughtbot.com), a design and
development consultancy that brings your digital product ideas to life.
We also love to share what we learn.

This coding exercise comes from [Upcase](https://thoughtbot.com/upcase),
the online learning platform we run. It's part of the
[Refactoring](https://thoughtbot.com/upcase/refactoring) course and is just one small sample of all
the great material available on Upcase, so be sure to visit and check out the rest.

## Exercise Intro

In this exercise, you'll be cleaning up controller called `ExpensesController`. This controller has a number of responsibilities:

1. List out existing expenses for a user
* Filter expenses by amount and approval status
* Create a new expense
* Email an admin after expenses are created
* Change name or amount unapproved expenses
* Mark expenses as deleted

That's quite a bit! Time to slim things down.

## Instructions

To start, you'll want to clone and run the setup script for the repo

    git clone git@github.com:thoughtbot-upcase-exercises/cleaning-up-a-controller.git
    cd cleaning-up-a-controller
    bin/setup

Before you get started, make sure you run `./bin/setup` to install gems
and set up your database.

You're going to want to do a few things to the existing controller code:

1. All public methods should be as RESTful as possible
* Make sure the only logic that lives in your controller is related to handling
your requests and responses
* Apply other techniques from previous exercises and tutorials to clean up this
controller as much as possible

Make sure to write tests for any new classes you create during this exercise.

Also, make sure all tests pass before submitting by running `rake`.

## Featured Solution

Check out the [featured solution branch](https://github.com/thoughtbot-upcase-exercises/cleaning-up-a-controller/compare/featured-solution#toc) to
see the approach we recommend for this exercise.

## Forum Discussion

If you find yourself stuck, be sure to check out the associated
[Upcase Forum discussion](https://forum.upcase.com/t/refactoring-cleaning-up-a-controller/4645)
for this exercise to see what other folks have said.

## Next Steps

When you've finished the exercise, head on back to the
[Refactoring](https://thoughtbot.com/upcase/refactoring) course to find the next exercise,
or explore any of the other great content on
[Upcase](https://thoughtbot.com/upcase).

## License

cleaning-up-a-controller is Copyright © 2015-2018 thoughtbot, inc. It is free software,
and may be redistributed under the terms specified in the
[LICENSE](/LICENSE.md) file.

## Credits

![thoughtbot](https://presskit.thoughtbot.com/assets/images/logo.svg)

This exercise is maintained and funded by
[thoughtbot, inc](http://thoughtbot.com/community).

The names and logos for Upcase and thoughtbot are registered trademarks of
thoughtbot, inc.
