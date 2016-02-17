desc "Run all tests on generated Jekyll site"
task :test do
  Rake::Task[:preamble_syntax].invoke
  Rake::Task[:link_check].invoke
  #Rake::Task[:html_check].invoke
end
