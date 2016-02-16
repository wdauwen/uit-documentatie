task :build_test do
  system "bundle exec jekyll build --config _config.test.yml"
end
