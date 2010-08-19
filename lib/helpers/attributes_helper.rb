module MachinedRails::Helpers
  module AttributesHelper
    def attributes_for(*args)
      options = args.extract_options!
      resource = args[0]
      attributes = args[1..-1]
      content_tag(:ul, nil, :class => :attributes) do
        attributes.map do |attribute|
          attribute(resource, attribute, options[attribute])
        end.join(' ')
      end
    end

    def attribute(resource, attribute, options)
      value = resource.send(attribute)
      if options
        value = options.call(value)
      end
      label = label_for(resource, attribute)
      display_value = value_for(resource, attribute, value)
      content_tag(:li) do
        [
          content_tag(:div, label, :class => "field-label"),
          content_tag(:div, display_value, :class => "field-value"),
        ].join(' ')
      end
    end

    protected
    def label_for(resource, attribute)
      I18n.t attribute, :scope => [:formtastic, :labels, resource.class.name.downcase], :default => attribute.to_s.humanize
    end

    def value_for(resource, attribute, value)
      case value
      when Array
        if value.any?
          value.to_sentence
        else
          "None"
        end
      when Time
        I18n.l value, :format => :date_and_hour_and_minute
      when Date
        value
      else
        value
      end
    end
  end
end
