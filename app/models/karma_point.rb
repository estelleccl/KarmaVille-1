class KarmaPoint < ActiveRecord::Base
 attr_accessible :user_id, :label, :value
 belongs_to :user
 before_save :get_value
 after_save :update_change

 validates :user, :presence => true
 validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
 validates :label, :presence => true

 def get_value
   	if id
      @before_change = KarmaPoint.find(self.id).value
   	else
      @before_change = 0
   	end
 end

 def update_change
    change = value - @before_change
    user = User.find(user_id)
    user.total_karma += change
    user.save
 end
 