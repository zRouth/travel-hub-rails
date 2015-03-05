class PostSerializer < ActiveModel::Serializer
  attributes :id,
             :text,
             :image_url,
             :thumbnail_url,
             :link,
             :source,
             :post_date,
             :likes
end
