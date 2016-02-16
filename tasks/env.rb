# This file contains the environment configuration shared by all tasks

ROOT_DIR = File.expand_path('../..', __FILE__)

# Sync all stdout/stderr to play nice with buildtools
# running the rake tasks.
$stdout.sync = true
$stderr.sync = true

# Basedir for all output.
RESULTS = ENV['results'] || "#{ROOT_DIR}/_site"
