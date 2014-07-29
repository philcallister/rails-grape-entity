# == Schema Information
#
# Table name: todos
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  complete    :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Todo < ActiveRecord::Base
  has_many :items
end
