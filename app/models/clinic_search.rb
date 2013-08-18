module ClinicSearch
  #Tire.configure{ logger 'log/tire.log'}
  #Tire.configure { logger 'log/tire.log', :level => 'debug' }

  def self.included(base)
    base.send :include, Tire::Model::Search
    base.send :include, Tire::Model::Callbacks

    base.mapping do
      base.indexes :full_name, analyzer: 'snowball', boost: 10000000000
      base.indexes :specialty, analyzer: 'snowball', boost: 10000000000
      base.indexes :description, analyzer: 'snowball'
      base.indexes :coordinates, type: 'geo_point'
      base.indexes :pediatric, type: 'boolean'
    end

    def base.elasticsearch(params, options={})
      tire.search() do
        query() do
          if params[:query].blank?
            all
          else
            boolean do
              should { string "full_name: #{params[:query]}" }
              should { string "specialty: #{params[:query]}" }
              should { string "description: #{params[:query]}" }
            end
          end
        end

        #filter(:and, Clinic.query_builder(params)) unless Clinic.query_builder(params).empty?
        #
        if options[:children] == 'true'
          filter :term, :pediatric => true
        end

        if options[:adult] == 'true'
          filter :term, :pediatric => false
        end

        if params[:location].present?
          filter :geo_distance, coordinates: params[:location], distance: "#{params[:distance] || 15}km"
          sort { by :_geo_distance, coordinates: params[:location], order: 'asc', unit: 'km' }
        end

        sort { by :rating }
      end
    end

    #def base.query_builder(params)
    #  query = []
    #  query << {:terms => {day_of_week: params[:day]}} if params[:day].present?
    #  query << {:terms => {schedule: params[:week_days]}} if params[:week_days].present?
    #  query
    #end
  end

  def to_indexed_json
    to_json(
        methods: [:full_name, :specialty, :description, :coordinates, :pediatric]
    )
  end

end

