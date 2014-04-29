
require 'securerandom'

module Agents
  class BandsAgent < Agent
    cannot_receive_events!
    default_schedule "8pm"

    description do
      <<-MD
        The Bands Agent uses the Bandsintown API to make sure you don't miss any shows

        Fill in the band and city in the options, and choose an app_id (you don't need to sign up)
      MD
    end

    event_description <<-MD
      {
        type: "concert",
        band: "band",
        city: "city",
        date: "date",
        venue: "venue"
      }
    MD

    def working?
      event_created_within?(2) && !recent_error_logs?
    end

    def check
      self.memory["bandy"] = "Hurlor"
      create_event :payload => band_event
    end

    def default_options
      {
        'app_id'  => 'YOUR_APP_ID',
        'band'    => 'The Devil Makes Three',
        'city'    => 'Madison, WI'
      }
    end

    def validate_options
      true
    end

    private

    def band_event
      {
        type:   "concert",
        band:   "band",
        city:   "city",
        date:   "date",
        venue:  "venue"
      }
    end
  end
end

