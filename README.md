ping
====

A rails service pings your host. It's a simple service, you add your host, and it save every http response time. Use d3.js to make the response time chart.

![ping](https://raw.github.com/eguitarz/ping/14851f6b7f38a92397a204efc3bb8be33363f698/screenshot.png)

install
=======
```
git clone https://github.com/eguitarz/ping.git
bundle install
```

use
===
```ruby
rails s
rake ping # pings every 60 seconds (default)

# or

rake ping[5] # pings every 5 seconds
```