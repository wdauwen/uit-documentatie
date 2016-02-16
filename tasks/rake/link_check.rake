task :link_check => [:build_test] do
  system "htmlproof #{RESULTS} --only-4xx"
end
