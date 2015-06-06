RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.infer_spec_type_from_file_location!
  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
