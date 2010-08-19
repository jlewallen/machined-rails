module MachinedRails::Helpers
  module DeveloperHelper
    def developer(&block)
      return unless request.remote_ip == '127.0.0.1'
      content_tag(:div, :class => :developers) do
        yield
      end
    end
  end
end
