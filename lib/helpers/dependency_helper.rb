module MachinedRails::Helpers
  module DependencyHelper
    def add_empty_expansions(key)
      self.javascript_expansions[key] = [] unless self.javascript_expansions.has_key?(key)
      self.stylesheet_expansions[key] = [] unless self.stylesheet_expansions.has_key?(key)
    end

    def use(bundle)
      content_for(:head) do
        add_empty_expansions(bundle)
        [
          javascript_include_tag(bundle),
          stylesheet_link_tag(bundle)
        ].join(' ')
      end
    end
  end
end
