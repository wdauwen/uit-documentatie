task :preamble_syntax do
  begin
    require "preamble"
  rescue LoadError
    fail "Please install preamble gem!"
  end

  Dir.glob("#{ROOT_DIR}/content/**/*.md").each do |file|
    puts "Checking #{file.sub("#{ROOT_DIR}/", "")}"

    begin
      parsed = Preamble.load(file)
    rescue RuntimeError
      fail "No preamble in file #{file}"
    end

    if parsed.metadata
      if ! parsed.metadata.is_a?(Hash)
        fail "Invalid preamble syntax in file #{file}"
      end
    end
  end
end
