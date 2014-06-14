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
> pg_ctl start -D /usr/local/var/postgres
> rake db:create
> rake db:migrate
> rake db:schema:load

> If you need some basic data, load the seed file with  rake db:seed
```

## The test part
```
> rake test:all:db
```

## The run it part
```
> rails s
```
> rails c    if you want to play around in console.

## Behold! The wonderous beauty of the nerdbeers rails-edition
Open your web browser and visit http://localhost:3000/