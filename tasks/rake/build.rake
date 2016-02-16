desc "Generate Jekyll site"
task :build do
  system "bundle exec jekyll build"
end
