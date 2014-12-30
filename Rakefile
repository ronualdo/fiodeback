require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

task :default => [:test, :features]
task :features => ["serverup"]

task :serverup do
  system "rackup -D -P build/server.pid config.ru"
  sleep 3
end

task :serverdown do
  pid = File.open("build/server.pid", &:readline)
  is_down = system "kill #{pid}"

  is_down ? puts("Server is down") : puts("Impossible to kill process") 
end

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.cucumber_opts = "features --format pretty"
end

task :features do
  begin
    Rake::Task[:cucumber].invoke
  ensure
    Rake::Task[:serverdown].invoke
  end
end

task :test do
  fail unless system "mocha"
end
