# == Schema Information
#
# Table name: type_of_checks
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :bigint
#  organizations_id :bigint
#
# Indexes
#
#  index_type_of_checks_on_category_id       (category_id)
#  index_type_of_checks_on_organizations_id  (organizations_id)
#

class TypeOfCheck < ApplicationRecord
  belongs_to :organizations
  belongs_to :category
end
