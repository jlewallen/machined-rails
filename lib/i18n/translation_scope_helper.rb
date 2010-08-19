require 'i18n/hash_recursive_merge'
require 'i18n/hash_to_yaml_sorted'
require 'i18n/automatic_translations'
require 'i18n/translation_saver'
require 'i18n/string_helper'

module MachinedRails::I18n
  module TranslationScopeHelper
    def tc
      StringHelper.new(get_scope_of_context)
    end

    private
      def get_scope_of_context
        stack_to_analyse = $lc_test_get_scope_of_context_stack || caller
        app_dirs = '(helpers|controllers|views|models)'
        latest_app_file = stack_to_analyse.detect { |level| level =~ /.*\/app\/#{app_dirs}\// }
        return [] unless latest_app_file
        
        path = latest_app_file.match(/([^:]+):\d+.*/)[1]
        dir, file = path.match(/.*\/app\/#{app_dirs}\/([^\.]+)/)[1, 2]
        
        scope = file.split('/')
        case dir
        when 'controllers'
          scope.last.gsub! /_controller$/, ''
        when 'helpers'
          scope.last.gsub! /_helper$/, ''
        when 'views'
          scope.last.gsub! /^_/, ''
        when 'models'
          scope.last.gsub! /_observer$/, ''
        end
        
        scope.join('.')
      end
  end
end
