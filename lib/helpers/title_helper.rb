module MachinedRails::Helpers
  # Original:
  # http://github.com/DefV/title_helper/blob/master/lib/title_helper.rb
  # Author: DefV
  module TitleHelper
    def title(args, options = {})
      case args
      when String
        @title = args
        options[:class] ||= [:title]
        options[:class] = [options[:class], 'error'].flatten.compact.join(' ') if options[:error]
        
        title = [options[:header], @title, options[:trailer]].compact.join(' ')
        title = title.html_safe if title.respond_to?(:html_safe)
        
        return content_tag(:h1, title, options.except(:error, :header, :trailer))
      when Hash
        sitename = args[:site_name]
        if @title
          return "#{strip_tags(@title)} - #{sitename}"
        else
          return "#{sitename}"
        end
      end
    end
  end
end
