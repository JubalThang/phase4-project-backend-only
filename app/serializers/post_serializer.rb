class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :likes
end
