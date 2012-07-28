# config/unicorn.rb

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
end

app_name = 'mlug'

env = ENV["RAILS_ENV"] || "development"

puts "Running unicorn in #{env} environment..."

worker_processes 2
preload_app true
timeout 30

short_env = case env
            when "development" then "dev"
            when "production" then "prod"
            else env
            end

capdir = "/srv/#{app_name}"
listen "/tmp/unicorn.#{app_name}.#{short_env}.socket"

#if env == "development"
#  ip = [ '46.73.224.36', '0.0.0.0' ]
#  ip.each do |address|
#    listen "#{address}:8080"
#  end
#end

listen 8080
#listen "46.73.224.36:8888"

# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.
# working_directory "#{capdir}/current"

# feel free to point this anywhere accessible on the filesystem
# user 'rails', 'rails'
# shared_path = "#{capdir}/shared"

# stderr_path "#{shared_path}/log/unicorn.stderr.log"
# stdout_path "#{shared_path}/log/unicorn.stdout.log"

pid "/tmp/unicorn.#{app_name}.#{short_env}.pid"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end

  sleep 1
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end

