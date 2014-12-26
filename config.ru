use Rack::Static, 
  :urls => ["/"], 
  :root => "public",
  :index => "index.html",
  :header_rules => [[:all, {'Cache-Control' => 'public, max-age=3600'}]]

run lambda { |env|
  [
    404,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    ['Not Found']
  ]
}
