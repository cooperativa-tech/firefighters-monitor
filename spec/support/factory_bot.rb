RSpec.configure do |config|
  BLACKLISTED_FACTORIES = %i[].freeze

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.cleaning do
      FactoryBot.lint(FactoryBot.factories.reject { |f| BLACKLISTED_FACTORIES.include?(f.name) })
    end
  end
end
