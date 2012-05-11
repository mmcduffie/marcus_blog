class Comment < ActiveRecord::Base
  include Rakismet::Model
  belongs_to :post
  validates_format_of :website, :with => URI::regexp(%w(http https)), :allow_blank => true
  attr_accessor :body, :website # Rakismet needs these
  rakismet_attrs :content => :body, :author_url => :website
end
