class Category < ApplicationRecord
  belongs_to :jobs,optional: true
  belongs_to :users, optional: true
end
