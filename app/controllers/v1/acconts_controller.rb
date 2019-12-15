class V1::AccontsController < V1::BaseController
  power :acconts, map: {
    [:index] => :acconts_index,
    [:show] => :acconts_show,
    [:create] => :creatable_acconts,
    [:update] => :updatable_acconts,
    [:destroy] => :destroyable_acconts
  }, as: :acconts_scope


  def create
    accont = scope.new(accont_params)
    current_user.accont = accont
    if current_user.save
      data = { show_key => current_user.as_api_response(show_template, template_injector) }
      render_created(data: data, message: created_message)
    else
      render_unprocessable_entity(error: resource)
    end
  end

  private

    def accont_params
      params.permit(
        :email,
        :account_number,
        :account_balance,
        :user_id
      )
    end
end
