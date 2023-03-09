=========

rails version of nerdbeers

getting started
==========

## The rails part
```
git clone https://github.com/nerdbeers/nerdbeers.git
cd nerdbeers
bundle install
```

## The database part
```
cp config/database.yml.default config/database.yml
pg_ctl start -D /usr/local/var/postgres
rake db:create
rake db:migrate
rake db:schema:load

# If necessary, season config/database.yml to taste.
# If you need some basic data, load the seed file with rake db:seed
```

## The test part
```
rake test:all:db
# we can create a rake alias or a bash alias so we can just do 'rake t' and get the proper command
```

## The run it part
```
rails s
```

If you want to play around in console
```
rails c    
```

## Behold! The wonderous beauty of the nerdbeers rails-edition
Open your web browser and visit http://localhost:3000/
