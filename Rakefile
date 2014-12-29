require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

task :default => [:features]
task :features => ["serverup"]

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end


task :serverup do
  system "rackup -D -P build/server.pid config.ru"
  sleep 3
end

task :serverdown do
  pid = File.open("build/server.pid", &:readline)
  is_down = system "kill #{pid}"

  is_down ? puts("Server is down") : puts("Impossible to kill process") 
end
