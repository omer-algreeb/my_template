RailsAdmin.config do |config|
  ### Popular gems integration
  I18n.default_locale = :ar

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  config.authorize_with do
    # debugger
    # if request.headers['Authorization'].present?
    #   @current_user = AuthorizeApiRequest.new(request.headers).call
    #   redirect_to main_app.access_login_path unless @current_user
    # else
    #   redirect_to main_app.access_login_path
    # end
    redirect_to main_app.access_login_path unless session[:user_id].present?
  end

  config.model 'User' do
    include_all_fields # all other default fields will be added after, conveniently
    field :password
    field :avatar
    exclude_fields :password_digest # but you still can remove fields
  end

  # other config stuff ...
  # config.parent_controller = '::RailsAdminCustomController'


  config.actions do

    dashboard do
      i18n_key :dashboard
    end

    index do
      i18n_key :index
    end
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
