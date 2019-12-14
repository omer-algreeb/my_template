class Accont < ApplicationRecord
  include AccontPresenter

  belongs_to :user

end
