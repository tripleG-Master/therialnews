class Post < ApplicationRecord
    belongs_to :user 

=begin
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy 
=end

    has_many :comments, dependent: :destroy
    
    validates :headline, presence: true
end
