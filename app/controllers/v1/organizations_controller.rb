class V1::OrganizationsController < V1::BaseController
  power :organizations, map: {
    [:index] =>   :organizations_index,
    [:show] =>    :organizations_show,
    [:create] =>  :creatable_organizations,
    [:update] =>  :updatable_organizations,
    [:destroy] => :destroyable_organizations
  }, as: :organizations_scope

  # GET: /v1/organizations
  # def index; end

  ## ------------------------------------------------------------ ##

  # POST /v1/organizations/:id
  # def create; end

  ## ----------------------------------------------------------##

  # GET: /v1/organizations/:id
  # def show; end

  ## ------------------------------------------------------------ ##

  # PUT/PATCH: /v1/organizations/:id
  # def update; end

  ## ------------------------------------------------------------ ##

  # DELETE: /v1/organizations/:id
  # def destroy; end

  ## ------------------------------------------------------------ ##

  private

    def organization_params
      params.permit(
        :name,
        :website,
        :admin_email,
        :contact_number,
        :address,
        :city,
        :country,
        :slug,
        :name_ar,
        :address_ar,
        :city_ar,
        :country_ar
      )
    end
end
