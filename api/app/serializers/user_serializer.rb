class UserSerializer < ActiveModel::Serializer
  # ここから記述
    attributes :id, :name, :email
    has_many :todos 
  # ここまで記述
  end
  