class SpreeFancyboxHooks < Spree::ThemeSupport::HookListener
  replace :product_images, 'products/product_images'
  insert_after :inside_head, 'shared/fancybox_include'
end