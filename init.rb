Redmine::Plugin.register :redmine_terms do
  name 'Redmine Terms plugin'
  author 'John Paul'
  description 'This plugin adds Terms and Conditions for Redmine users.'
  version '0.0.1'
  end

prepare_block = Proc.new do
  User.send(:include, RedmineTerms::UserPatch)
  AccountController.send(:include, RedmineTerms::AccountControllerPatch)
   

end


if Rails.env.development?
 ActionDispatch::Reloader.to_prepare { prepare_block.call }
else
  prepare_block.call
end
require 'redmine'
require 'redmine_terms/user_patch'
require 'redmine_terms/account_controller_patch'



