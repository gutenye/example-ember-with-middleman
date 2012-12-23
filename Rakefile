require "fileutils"

def alias_task(new, old)
  task new, Rake::Task[old].arg_names => old
end

task :server do
  system "bundle exec middleman server"
end

alias_task :s, :server

desc "build the site"
task :build do
  system "bundle exec middleman build -c"

  FileUtils.rm_r Dir["build/app/*"] - Dir["build/app/{application,ie}.js"], verbose: true
  FileUtils.rm_r Dir["build/stylesheets/*"] - Dir["build/stylesheets/{application}.css"], verbose: true
end

desc "deploy app"
task :deploy do
  ENV["MM_ENV"] = "production"
  Rake::Task["build"].invoke

  origin = `git config remote.origin.url`.chomp
  cd "build" do
    system "git init"
    system "git remote add origin #{origin}"
    system "git checkout -b gh-pages"
    system "git checkout -b gh-pages"
    system "git add ."
    puts "\n## Commiting: Site updated at #{Time.now.utc}"
    system "git commit -m \"Site updated at #{Time.now.utc}\""
    puts "\n## Pushing generated website"
    system "git push origin gh-pages --force"
    puts "\n## Github Pages deploy complete -- http://GutenYe.github.com/example-ember-with-middleman"
  end
end
