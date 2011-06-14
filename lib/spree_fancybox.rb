require 'spree_core'
require 'spree_fancybox_hooks'

module SpreeFancybox
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end

      Image.attachment_definitions[:attachment][:styles] =
        { :mini => '48x48>', :small => '100x100>', :product => '240x240>',
          :large => '600x600>', :fancy => '960x960>' }

      Product.class_eval do
        def has_image_without_style?(style)
          return true if contains_image_without_style?(images, style)
          if !variants.blank?
            variants.each do |variant|
              return true if contains_image_without_style?(variant.images, style)
            end
          end
          return false
        end
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
