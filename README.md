# Firefighters Monitor

This is a simple Rails app that offers monitoring functionalities for firefighter headquarters. It's a port of a previous project that was powering the Firefighters Headquarters at Esposende, Portugal.

Still a work in progress, will post more info on how it works later.

## Prequisites

To run this project you will need the following tools and runtimes:

- Ruby 2.6.5
- Node 12.\*
- Postgres 10 and greater
- Chromedriver
- Redis

Here at our team, we use [asdf-vm](https://github.com/asdf-vm/asdf) to manage our Ruby and Node versions, we recommend that heavily. You can install Postgres and Redis with `homebrew` and Chromedriver with `homebrew cask`.

Our `bin/setup` script will handle installing Ruby and Node if you have [asdf-vm](https://github.com/asdf-vm/asdf) properly installed.

## Tech

We opted on not having a SPA at the front of the app. Instead, we are using Stimulus and StimulusReflex for interactivity. This allows us (at the time just 2 developers) to be pretty quick on implementing features.

The scheduler functionality allows firefighters to signal when they will be available. For that we are using DelayedJob, which reads incoming jobs from our Postgres database. We are using Postgres for reliability, as we don't want events to be lost on Redis with the alternative Sidekiq. We need to run the DelayedJob daemon for this to work, the procfiles for dev and production take care of that.

Redis is needed to take care of the ActionCable stuff we are using. It also helps speed up StimulusReflex (which uses ActionCable).

## Testing

Run `rake spec` for tests. We are testing heavily, from simple (but not crazy) unit tests to full integration tests.

# Developing

Just run `bin/server` to start hammering away at it. Access the server at `localhost:5000`

Also don't forget to setup the default admin user with `rake populate:admin_user`. The default credentials are `admin`, the password being `foobar`.

We are using `Guard` to live reload code. Most changes cause a full page refresh. CSS replaces code using a `hot loading` strategy, kinda like `react-hot-loader` for quick development
