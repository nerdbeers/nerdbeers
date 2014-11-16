[![Code Climate](https://codeclimate.com/github/nerdbeers/nerdbeers/badges/gpa.svg)](https://codeclimate.com/github/nerdbeers/nerdbeers) [![Test Coverage](https://codeclimate.com/github/nerdbeers/nerdbeers/badges/coverage.svg)](https://codeclimate.com/github/nerdbeers/nerdbeers) [ ![Codeship Status for nerdbeers/nerdbeers](https://codeship.com/projects/64503e30-b1e5-0131-0260-0eab129fca73/status?branch=master)](https://codeship.com/projects/20007)
nerdbeers
=========

rails version of nerdbeers

getting started
==========

## The rails part
```
> git clone https://github.com/datachomp/nerdbeers.git
> cd nerdbeers
> bundle install
```

## The database part
```
> cp config/database.yml.default config/database.yml
> pg_ctl start -D /usr/local/var/postgres
> rake db:create
> rake db:migrate
> rake db:schema:load

> If necessary, season config/database.yml to taste.
> If you need some basic data, load the seed file with rake db:seed
```

## The test part
```
> rake test:all:db
> we can create a rake alias or a bash alias so we can just do 'rake t' and get the proper command
```

## The run it part
```
> rails s
```
> rails c    if you want to play around in console.

## Behold! The wonderous beauty of the nerdbeers rails-edition
Open your web browser and visit http://localhost:3000/


## Front end Part
> Currently using  bootstrap
> Turbo links has been removed
> Emberjs has been added but not wired up.

## Testing Ember Part
> we're going to need the  phantomjs gem and  teaspoon gem. framework will be qunit
