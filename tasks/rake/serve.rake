desc "Build and serve Jekyll site locally"
task :serve do
  puts "Starting up production Jekyll site server..."
  system "bundle exec jekyll serve --no-watch"
end
