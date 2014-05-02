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
```

## The test part
```
> rake test
```

## The run it part
```
> rails s
```

## Behold! The wondress beauty of the nerdbeers rails-edition
Open your web browser and visit http://localhost:3000/