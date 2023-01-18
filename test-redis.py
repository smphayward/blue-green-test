from redis.sentinel import Sentinel
import random
import time

# with IP based connections, a list of known node IP addresses is constructed
# to allow connection even if any one of the nodes in the list is unavailable.
sentinel_list = [
('192.168.2.90', 26379),
('192.168.2.90', 26380),
('192.168.2.90', 26381)
]

# change this to the db name you want to connect
db_name = 'master-a'

print("Creating Sentinel object from sentinel list...")
sentinel = Sentinel(sentinel_list, socket_timeout=0.1)
print()

print("Redis master:")
print(sentinel.discover_master(db_name))
print()

print("Redis slaves:")
print(sentinel.discover_slaves(db_name))
print()

print("Connecting to" + db_name + "...")
master = sentinel.master_for(db_name, socket_timeout=0.1)
print()


keys = ["foo", "bar", "baz", "quux", "waldo", "fred"]

while True:
  print()
  print("--- press CTRL+C to stop the test ---")
  print()

  for key in keys:
    value = random.randint(1000,9999)
    print("Setting " + key + " to value " + str(value))
    print(master.set(key, value))
    print("Getting value from " + key)
    print(master.get(key))
    print()
    time.sleep(1) # Sleep for 1 second
