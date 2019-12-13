class V1::AccontsController < V1::BaseController
  power :acconts, map: {
    [:index] => :acconts_index,
    [:show] => :acconts_show,
    [:create] => :creatable_acconts,
    [:update] => :updatable_acconts,
    [:destroy] => :destroyable_acconts
  }, as: :acconts_scope

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