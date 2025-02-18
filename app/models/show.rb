class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :network

    def actors_list
        self.actors.map { | actor | actor.full_name }
    end

    def build_network(call_letters:)
        new_network = Network.find_or_create_by(call_letters: call_letters)
        new_network.shows << self
    end
end