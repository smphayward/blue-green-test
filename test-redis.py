from redis.sentinel import Sentinel

# with IP based connections, a list of known node IP addresses is constructed
# to allow connection even if any one of the nodes in the list is unavailable.
sentinel_list = [
('192.168.2.90', 26379),
('192.168.2.90', 26380),
('192.168.2.90', 26381)
]

# change this to the db name you want to connect
db_name = 'master-a'

sentinel = Sentinel(sentinel_list, socket_timeout=0.1)
print("Redis master:")
print(sentinel.discover_master(db_name))
print("Redis slaves:")
print(sentinel.discover_slaves(db_name))

r = sentinel.master_for(db_name, socket_timeout=0.1)

# set key "foo" to value "bar"
print(r.set('foo', 'bar'))
# set value for key "foo"
print(r.get('foo'))