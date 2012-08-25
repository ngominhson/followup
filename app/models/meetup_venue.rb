class MeetupVenue < MeetupResource
  extend MeetupQueryable::ByGroup

  def self.for_event(event_id, api_key = nil)
    @api_key = api_key

    find_everything( :params => { :event_id => event_id } )
  end

  def self.for_id(id, api_key = nil)
    @api_key = api_key

    find_everything( :params => { :venue_id => id } )
  end

end