require 'securerandom'

module Agents
  class MovesAgent < Agent
    cannot_receive_events!

    description do
      <<-MD
        The MovesAgent queries the Moves API for your daily motions and activities.

        Fill in a Moves OAuth key to get started
      MD
    end

    event_description <<-MD
      event description goes here
    MD

    def working?
      !recent_error_logs?
    end

    def check
      self.memory["moves"] = "Hurlor"
      create_event :payload => {a: 1}
    end

    def default_options
      { 'OAuth Key' => "Change Me" }
    end

    def validate_options
      true
    end
  end
end

