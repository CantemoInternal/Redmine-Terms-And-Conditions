RedmineApp::Application.routes.draw do
  match 'terms_conditions', :controller => 'terms', :action => 'terms_st',:via=>[:get,:post]
end
