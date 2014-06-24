if ENV["REDISCLOUD_URL"]
    $r = Redis.new(:url => ENV["REDISCLOUD_URL"])
else
	$r = Redis.new(:host => "127.0.0.1", :port => 6379)	
end
$redis = Redis::Namespace.new(:el, :redis => $r)