require 'redmine'
require 'export_zip'

Redmine::Plugin.register :export_zip do
  name 'export_zip plugin'
  author 'yusuke tomimoto. ryosuke kawachi'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  permission :export_zip, {:issues_export => :export_zip}
end
