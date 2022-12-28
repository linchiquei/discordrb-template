ENV["RUBY_ENV"] ||= "development"
require "bundler/setup"
require "dotenv/load" if ENV["RUBY_ENV"] != "production"
require "./lib/factory_bot"


Bundler.require(:default, ENV["RUBY_ENV"])
loader = Zeitwerk::Loader.for_gem
loader.push_dir("#{File.dirname(__FILE__)}/src")
loader.setup

if Gem.loaded_specs.key?("rubocop")
  require "rubocop/rake_task"

  namespace :lint do
    RuboCop::RakeTask.new(:ruby)
  end

  desc "Run all linters"
  task lint: %i[lint:ruby]
end

task :bot do
  DiscordBot.run
end

task :cron do
  Cron.run
end

task :web do
  Rack::Server.start(
    Port: ENV["PORT"] || 4567,
    app: Webserver.new,
  )
end

task :all do
  #Process.fork { Rake::Task["cron"].invoke }
  Process.fork { Rake::Task["bot"].invoke }
  #Process.fork { Rake::Task["web"].invoke }
  Process.waitall
end
