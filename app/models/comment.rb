class Comment < ActiveRecord::Base
  include Rakismet::Model
  belongs_to :post
  validates_format_of :author_url, :with => URI::regexp(%w(http https)), :allow_blank => true
end
