redis: redis/redis-server redis/redis.conf
web: bundle exec rails server thin -p $PORT --config=config.ru
worker: bundle exec rake resque:work QUEUE=*
