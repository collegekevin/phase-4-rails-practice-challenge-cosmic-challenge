class MissionSerializer < ActiveModel::Serializer
  attributes :idm, :name
  has_one :scientist
  has_one :planet
end
