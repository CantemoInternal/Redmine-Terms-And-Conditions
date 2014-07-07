module RedmineTerms
    module AccountControllerPatch
      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable
          alias_method_chain :successful_authentication, :ext
#          alias_method_chain :register, :ext

        end
      end
 
    module InstanceMethods
    def successful_authentication_with_ext(user)
      logger.info "Successful authentication for '#{user.login}' from #{request.remote_ip} at #{Time.now.utc}"
      # Valid user
      self.logged_user = user
      # generate a key and set cookie if autologin
     if params[:autologin] && Setting.autologin?
       set_autologin_cookie(user)
     end
     call_hook(:controller_account_success_authentication_after, {:user => user })
     redirect_to :controller => 'terms', :action => 'terms_st'
   end
  end
end
end
