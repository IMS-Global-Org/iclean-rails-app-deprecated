class BackgroundJobWorker
  include Sidekiq::Worker
  sidekiq_options retry: 1, queue: 'mailer'

  def perform(job_type = nil)
    case job_type
    when 'easy'
      MicroJobWorker.perform_async
      sleep 2
      puts 'sleept 5 sec'
    when 'hard'
      MicroJobWorker.perform_async
      sleep 10
      puts 'slept 10 sec'
    else
      MicroJobWorker.perform_async
      puts 'slept "7" sec as micro job'
    end
  end
end
