class User < ActiveRecord::Base
  has_many :karma_points, :foreign_key => 'user_id', :primary_key => 'id'

  attr_accessible :first_name, :last_name, :email, :username

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    self.order('value_cache DESC').limit(50)
    # joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
  end

  def total_karma
    self.value_cache
    # self.karma_points.sum(:value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
