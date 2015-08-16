#classe de modelo dos comentários dos tickets
class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user

    delegate :name, :phone, :ddd, :email, :to => :user,  :prefix => true

  validates :content, presence: true, length: { minimum: 5, maximum: 600 }

  def automatic?
    is_automatic
  end
end
