web: bundle exec puma -p $PORT
worker: bundle exec sidekiq -c 10 -r ./workers/push_worker.rb
