desc "Syntax check Jekyll generated HTML"
task :html_check => [:build_test] do
  system "htmlproof #{RESULTS} --check-html --url-ignore '#'"
end
