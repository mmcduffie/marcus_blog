class Comment < ActiveRecord::Base
  belongs_to :post
  validates_format_of :website, :with => URI::regexp(%w(http https)), :allow_blank => true
end