module CreditsHelper

    def artists_for_select
        Artist.all.collect { |i| [i.artist_name, i.id] }
    end

end
