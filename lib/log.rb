module Log

  def geocode_log
    @geocode_log ||= Logger.new(Rails.root.join('log', 'geocode_ops.log'))
  end
end