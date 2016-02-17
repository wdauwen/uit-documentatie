task :link_check => [:build] do
  system "htmlproof #{RESULTS} --only-4xx"
end
