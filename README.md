# Rudr Mini Project

A sample app with a few API endpoints using Rails.

List of Users (for an Event)

/users (expects :event_id as a param)

Individual User (including score)

/users/:user_id

Authentication on both endpoints is done with a query param of "password". The password itself is stored in `secrets.yml`

Light testing was implemented with the built-in Rails testing capabilities, which can be run with `rake test`
