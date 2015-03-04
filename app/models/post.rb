class Post < ActiveRecord::Base #.all, .find(1) comes from AR::Base

	has_many :comments
	

# validate is an action (=method)
	validates  :title, presence: true, uniqueness: true
	validates :body, length: { minimum: 100 }

end
