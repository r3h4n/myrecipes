# Recipe-
# - recipe should be valid
# - name should be present
# -description should be present
# - chef_id should be present
# - maximum length for name and description for description

class Recipe < ApplicationRecord
 validates :name, presence: true
 validates :description, presence: true, length: {minimum: 5, maximum: 500}
  belongs_to :chef
 validates :chef_id, presence: true
end