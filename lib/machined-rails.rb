module MachinedRails
  module Helpers
    autoload :DependencyHelper, 'helpers/dependency_helper'
    autoload :DeveloperHelper,  'helpers/developer_helper'
    autoload :AttributesHelper, 'helpers/attributes_helper'
    autoload :TitleHelper,      'helpers/title_helper'
  end

  class Railtie < ::Rails::Railtie
  end
end

ActionController::Base.helper(MachinedRails::Helpers::DependencyHelper)
ActionController::Base.helper(MachinedRails::Helpers::DeveloperHelper)
ActionController::Base.helper(MachinedRails::Helpers::AttributesHelper)
ActionController::Base.helper(MachinedRails::Helpers::TitleHelper)
