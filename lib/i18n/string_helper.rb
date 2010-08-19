module MachinedRails::I18n
  class StringHelper
    def initialize(scope)
      @scope = scope
    end

    def add(key, args)
      options = args.extract_options!
      options.merge!({
        :scope => @scope,
        :default => args.first
      })
      AutomaticTranslations.add(key, options[:scope], args.first) if Rails.env == "development"
      I18n.translate(key, options)
    end

    def method_missing(method, *args)
      define_method(method)
      send(method, *args)
    end

    def define_method(method)
      StringHelper.class_eval <<-END
        def #{method}(*args)
          add(:#{method}, args)
        end
      END
    end
  end
end
