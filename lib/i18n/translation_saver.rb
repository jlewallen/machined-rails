module MachinedRails::I18n
  class TranslationsSaver
    def initialize(app)
      @app = app
    end

    def call(env)
      returning called = @app.call(env) do
        status, headers, response = called
        AutomaticTranslations.save
      end
    end
  end
end
