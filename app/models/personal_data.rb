class PersonalData < ApplicationRecord
  belongs_to :user,required: false

end
