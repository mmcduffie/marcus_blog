class Comment < ActiveRecord::Base
  include Rakismet::Model
  before_create :check_for_spam
  belongs_to :post
  validates_format_of :author_url, :with => URI::regexp(%w(http https)), :allow_blank => true
  def check_for_spam
    self.spam_status = spam?
    self.spam_message = akismet_response
    if self.spam_status
      return false
    end
  end
end
