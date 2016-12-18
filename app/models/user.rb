class User < ApplicationRecord
  has_one :about, :dependent => :destroy
  has_one :personal_data, :dependent => :destroy

  has_many :idioms, :dependent => :destroy
  has_many :jobs, :dependent => :destroy
  has_many :complementary_trainnings , :dependent => :destroy
  has_many :instituitions, :dependent => :destroy
  has_many :phones, :dependent => :destroy

  accepts_nested_attributes_for :about, :personal_data,:idioms,:jobs,:complementary_trainnings,:instituitions,:phones,
    reject_if: :all_blank, allow_destroy: true

end
