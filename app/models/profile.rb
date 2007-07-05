# A Profile is the representation and web-presence of an individual or an
# organization. Every Profile is attached to its VirtualCommunity of origin,
# which by default is the one returned by VirtualCommunity:default.
class Profile < ActiveRecord::Base

  has_many :domains, :as => :owner
  belongs_to :virtual_community

  validates_presence_of :identifier
  validates_format_of :identifier, :with => /^[a-z][a-z0-9_]+[a-z0-9]$/

  # creates a new Profile. By default, it is attached to the default
  # VirtualCommunity (see VirtualCommunity#default)
  def initialize(*args)
    super(*args)
    self.virtual_community ||= VirtualCommunity.default
  end

end
