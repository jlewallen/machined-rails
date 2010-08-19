module MachinedRails::Helpers
  module FormHelper
    def form_row(lbl, &block)
      content_tag(:li) do
        [
          content_tag(:label, lbl),
          content_tag(:div) do
            yield
          end
        ].join(' ')
      end
    end

    def check_box_for_attribute(name, checked, *args)
      options = args.extract_options!
      url = options.delete(:url)
      check_box_tag(name, 1, checked, :url => url, :class => 'async-flag')
    end
  end
end
