class Category < ApplicationRecord
  include FriendlyId
  friendly_id :title, use: :slugged
  has_and_belongs_to_many :articles, join_table: :articles_categories
end
