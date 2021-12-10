class UsersController < ActionController::Base
  def homepage
    render({ :template => "user_templates/home.html.erb"})
  end
  def index
    @the_user = User.new
    matching_users = User.all
    @users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index.html.erb"})
end
def details 
  the_id = session[:user_id]
    @current_user = User.where({ :id => the_id }).first
  render ({ :template => "user_templates/details.html.erb"})
end
end

