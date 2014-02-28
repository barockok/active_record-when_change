# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require 'pry'
require 'database_cleaner'
require 'active_record/when_change'
ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + '/test.log')
ActiveRecord::Base.establish_connection(:adapter => "sqlite3",
                                       :database => File.dirname(__FILE__) + "/test.sqlite3")
load File.dirname(__FILE__) + '/support/schema.rb'
load File.dirname(__FILE__) + '/support/post.rb'
load File.dirname(__FILE__) + '/support/constants_helper.rb'
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include ConstantsHelper
  config.before(:suite) do
    DatabaseCleaner.strategy = :deletion
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.mock_with :rr

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
load File.dirname(__FILE__) + '/support/shared_example.rb'
