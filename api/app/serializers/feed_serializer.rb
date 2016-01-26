class FeedSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
end
