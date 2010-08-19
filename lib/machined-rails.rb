module MachinedRails
  module Helpers
    autoload :DependencyHelper, 'helpers/dependency_helper'
    autoload :DeveloperHelper,  'helpers/developer_helper'
    autoload :AttributesHelper, 'helpers/attributes_helper'
    autoload :TitleHelper,      'helpers/title_helper'
    autoload :FormHelper,       'helpers/form_helper'
    autoload :TimeHelper,       'helpers/time_helper'
  end

  class Railtie < ::Rails::Railtie
    initializer "machined-rails.initialize-helpers" do
      ActionController::Base.helper(MachinedRails::Helpers::DependencyHelper)
      ActionController::Base.helper(MachinedRails::Helpers::DeveloperHelper)
      ActionController::Base.helper(MachinedRails::Helpers::AttributesHelper)
      ActionController::Base.helper(MachinedRails::Helpers::TitleHelper)
      ActionController::Base.helper(MachinedRails::Helpers::FormHelper)
      ActionController::Base.helper(MachinedRails::Helpers::TimeHelper)
    end
  end
end
