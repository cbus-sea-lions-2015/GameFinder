web: bundle exec rake db:create
web: bundle exec rake db:migrate
web: bundle exec rails server -p $PORT
worker: bundle exec sidekiq -c 5 -v
