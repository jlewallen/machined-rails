module MachinedRails::I18n
  class AutomaticTranslations
    def self.path
      Rails.root.join("config/locales/auto.en.yml")
    end

    def self.load
      @all ||= (File.exists?(path) ? YAML::load(IO.read(path)) : {})
    end

    def self.save
      if @all
        data = self.deep_stringify_keys(@all).to_yaml
        Rails.logger.debug("Saving Auto-Translations...")
        FileUtils.mkdir_p File.dirname(path)
        File.open(path, "w") do |file|
          file.puts data
        end
      end
    end

    def self.deep_stringify_keys(hash)
      returning r = ActiveSupport::OrderedHash.new do
        hash.keys.sort { |a, b| a.to_s <=> b.to_s }.each do |key|
          value = hash[key]
          value = deep_stringify_keys(value) if value.is_a? Hash
          r[(key.to_s rescue key) || key] = value
        end
      end
    end

    def self.merge(keys)
      @all = load.rmerge(deep_stringify_keys(keys))
    end

    def self.add(keys, scope, default)
      keys = I18n.normalize_keys(I18n.default_locale, keys, scope)
      keys = keys.reverse.inject(default) { |a, b| { b => a } }
      merge(keys)
    end
  end
end
