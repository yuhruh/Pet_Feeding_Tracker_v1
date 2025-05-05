# README
Using RoR, Heroku and Chartkick to record feeding amount a day with dry and wet food. The app can show the raw data and column chart to see the feeding trends.

https://test-tracker-v1-68679b6d52bd.herokuapp.com/

# Requirements
- Sign In/Sign Out/Sign Up, having basic validation on email and password.
- add/edit/delete records.
- edit/ delete users by their own.
- automatically show the current date and time when creating a new record, date can not be a future date and time can not be records in (current time + 1 minute).
- show the column chart following the records.
- pagination for users and records.


# Improvement
- add timezone selection when users sign up, so the records can convert the users' timezone. Not set in the app.
- add multiple pets selection for record.
- add unit selection for record.
- automatically show the pet's love food when creating a new record for a new day.
- add new column for weights, numbers of pee and poo/day, note. 
