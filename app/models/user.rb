class User < ActiveRecord::Base
  attr_accessible :user_name, :user_pass, :user_mail, :user_img
end
