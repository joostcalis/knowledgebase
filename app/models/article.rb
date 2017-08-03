class Article < ApplicationRecord
  include FriendlyId
  friendly_id :title, use: :slugged

  has_and_belongs_to_many :categories, join_table: :articles_categories
  has_and_belongs_to_many :tags, join_table: :articles_tags

  enum access_level: {admin: 0, fuga_only: 5, all: 10}
end
