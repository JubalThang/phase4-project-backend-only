class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :likes

  belongs_to :user
end
