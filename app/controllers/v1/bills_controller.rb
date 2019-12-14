class V1::BillsController < V1::BaseController
  power :bills, map: {
    [:index] => :bills_index,
    [:show] => :bills_show,
    [:create] => :creatable_bills,
    [:update] => :updatable_bills,
    [:destroy] => :destroyable_bills
  }, as: :bills_scope



  # def create
  #   data = current_user.bills.create(bill_params)
  #   render_created(data: data, message: Message.account_created)
  # end


  private

    def bill_params
      params.permit(
        :title,
        :price,
        :date,
        :description,
        :type_bill
      )
    end
end