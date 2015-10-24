Geocoder.configure(
  # geocoding options
  # :timeout      => 3,           # geocoding service timeout (secs)
  :lookup       => :bing,     # name of geocoding service (symbol)
  # :language     => :en,         # ISO-639 language code
  :use_https    => true,       # use HTTPS for lookup requests? (if supported)
  # :http_proxy   => nil,         # HTTP proxy server (user:pass@host:port)
  # :https_proxy  => nil,         # HTTPS proxy server (user:pass@host:port)
  :api_key      => 'VfWBSYar8z9EF6RBoDS0~j93OLwiR40Yyjzxcfxx_kg~AmolWsnTGx_qEFovoQG2s3oHub3Mu3FQaf4-Sz9bEBFp1g4NZp1K6V6UUJR90zdM',         # API key for geocoding service
  # :cache        => nil,         # cache object (must respond to #[], #[]=, and #keys)
  # :cache_prefix => "geocoder:", # prefix (string) to use for all cache keys

  # exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and TimeoutError
  # :always_raise => [],

  # calculation options
  # :units     => :mi,       # :km for kilometers or :mi for miles
  # :distances => :linear    # :spherical or :linear
)
