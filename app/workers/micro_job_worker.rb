class MicroJobWorker
  include Sidekiq::Worker
  sidekiq_options retry: 1, queue: 'critical'

  def perform(*args)
    redis = Redis.new(host: '127.0.0.1', port: 6379)
    msg = redis.get('brennick')
    sleep 7
    puts 'Micro Job Ran Successfully!'
    puts "Redis Job Fetched: #{msg}"
  end
end
