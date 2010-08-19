module MachinedRails::Helpers
  module TinyMceHelper
      def initialize_tiny_mce(theme=:simple, mode=:textareas)
        javascript_tag do <<-END
  $(function() {
  tinyMCE.init({
    mode : "#{mode}",
    theme : "#{theme}"
  });
  });
      END
    end
  end
end
