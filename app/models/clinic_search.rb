module ClinicSearch
  #Tire.configure{ logger 'log/tire.log'}
  #Tire.configure { logger 'log/tire.log', :level => 'debug' }

  def self.included(base)
    base.send :include, Tire::Model::Search
    base.send :include, Tire::Model::Callbacks

    base.settings analysis: {
        filter: {
            partial_ngram: {
                type: "NGram",
                min_gram: 5,
                max_gram: 8}
        },
        analyzer: {
            partial_analyzer: {
                tokenizer: "lowercase",
                filter: ["partial_ngram"],
                type: "custom"}
        }
    } do
      base.mapping do
        base.indexes :last_name, analyzer: 'snowball', boost: 10000000000
        base.indexes :full_name, analyzer: 'partial_analyzer', boost: 10000000000
        base.indexes :specialty, analyzer: 'partial_analyzer', boost: 10000000000
        base.indexes :description, analyzer: 'partial_analyzer'
        base.indexes :employer, analyzer: 'partial_analyzer'
        base.indexes :coordinates, type: 'geo_point'
        base.indexes :pediatric, type: 'boolean'
        base.indexes :published, type: 'boolean'
      end
    end

    def base.elasticsearch(params, options={})
      tire.search() do
        query() do
          if params[:query].blank?
            all
          else
            boolean do
              should { string "last_name: #{params[:query]}" }
              should { string "full_name: #{params[:query]}" }
              should { string "specialty: #{params[:query]}" }
              should { string "description: #{params[:query]}" }
              should { string "employer: #{params[:query]}" }
            end
          end
        end

        filter :term, :published => true

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
  end

  def to_indexed_json
    to_json(
        methods: [:last_name, :full_name, :specialty, :description, :employer, :coordinates, :pediatric]
    )
  end

end

