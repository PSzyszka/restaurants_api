job_type :sidekiq, 'cd :path && :environment_variable=:environment bundle exec sidekiq-client push :task :output'

every 1.day, at: '13:00 am', roles: [:app] do
  sidekiq 'CustomerMessageWorker'
end
