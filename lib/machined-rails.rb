module MachinedRails
  module Helpers
    autoload :DependencyHelper, 'helpers/dependency_helper'
    autoload :DeveloperHelper,  'helpers/developer_helper'
    autoload :AttributesHelper, 'helpers/attributes_helper'
    autoload :TitleHelper,      'helpers/title_helper'
    autoload :FormHelper,       'helpers/form_helper'
    autoload :TimeHelper,       'helpers/time_helper'
    autoload :TinyMceHelper,    'helpers/tiny_mce_helper'
  end

  module I18n
    autoload :TranslationScopeHelper, 'i18n/translation_scope_helper'
  end

  class Railtie < ::Rails::Railtie
    initializer "machined-rails.initialize-helpers" do
      ActionController::Base.helper(MachinedRails::Helpers::DependencyHelper)
      ActionController::Base.helper(MachinedRails::Helpers::DeveloperHelper)
      ActionController::Base.helper(MachinedRails::Helpers::AttributesHelper)
      ActionController::Base.helper(MachinedRails::Helpers::TitleHelper)
      ActionController::Base.helper(MachinedRails::Helpers::FormHelper)
      ActionController::Base.helper(MachinedRails::Helpers::TimeHelper)
      ActionController::Base.helper(MachinedRails::Helpers::TinyMceHelper)
    end

    initializer "machined-rails.i18n" do
      ActionController::Base.send :extend, MachinedRails::I18n::TranslationScopeHelper
      ActionController::Base.send :include, MachinedRails::I18n::TranslationScopeHelper
      ActiveRecord::Base.send :extend, MachinedRails::I18n::TranslationScopeHelper
      ActiveRecord::Base.send :include, MachinedRails::I18n::TranslationScopeHelper
      ActionMailer::Base.send :extend, MachinedRails::I18n::TranslationScopeHelper
      ActionMailer::Base.send :include, MachinedRails::I18n::TranslationScopeHelper
      ActionView::Base.send :include, MachinedRails::I18n::TranslationScopeHelper
    end
  end
end
