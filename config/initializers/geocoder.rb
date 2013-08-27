Geocoder::Configuration.timeout = 8
Geocoder.configure(
  :timeout => 8,
  :always_raise => [Geocoder::OverQueryLimitError]
)