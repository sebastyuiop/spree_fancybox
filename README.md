Spree Fancybox
--------------

Simple extension for Spree that gives fancybox functionality on the product pages. No administration configuration needed at this point.

Installation
------------

    gem "spree_fancybox", :git => 'git://github.com/sebastyuiop/spree_fancybox.git'
    
    bundle install
    
    rake spree_fancybox:install
    
In your rails console you'll need to reprocess the paperclip thumbnails to allow for a new size called 'fancy'

    Image.all.each {|p| p.attachment.reprocess!}

Copyright (c) 2011 sebastyuiop, released under the New BSD License
