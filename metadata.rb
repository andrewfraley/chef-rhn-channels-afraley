name 'rhn-channels'
maintainer 'Andy Fraley'
maintainer_email 'andrew.fraley@gmail.com'
license 'MIT'
description 'Manages channel subscriptions to RHN satellite network.'
long_description 'Manages channel subscriptions to RHN satellite network.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.0'

supports 'redhat', '>= 5.0'

suggests 'chef-vault'
suggests 'rhn'
