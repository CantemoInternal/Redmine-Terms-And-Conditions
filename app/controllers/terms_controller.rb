class TermsController < ApplicationController
  unloadable
  skip_before_filter :check_if_login_required

  def terms_st
    @user = User.current 
    if request.get?
      if @user.status_tc
        redirect_back_or_default :controller => 'my', :action => 'page'
      end
    else  # request is post
      if params[:commit] == 'Accept' 
        @user.update_attribute('status_tc', true)
        redirect_back_or_default :controller => 'my', :action => 'page'  
      else
        redirect_back_or_default :controller => 'account', :action => 'logout'
      end
   end
 end
end
