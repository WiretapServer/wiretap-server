web: bundle exec puma -p $PORT
worker: bundle exec sidekiq -r ./workers/push_worker.rb
