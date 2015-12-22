# lita-xmpp

[![Build Status](https://travis-ci.org/lazyfrosch/lita-xmpp.png?branch=master)](https://travis-ci.org/lazyfrosch/lita-xmpp)
<!--
[![Code Climate](https://codeclimate.com/github/lazyfrosch/lita-xmpp.png)](https://codeclimate.com/github/lazyfrosch/lita-xmpp)
[![Coverage Status](https://coveralls.io/repos/lazyfrosch/lita-xmpp/badge.png)](https://coveralls.io/r/lazyfrosch/lita-xmpp)
-->

**lita-xmpp** is an adapter for [Lita](https://github.com/litaio/lita) that allows you to use the robot with a XMPP / Jabber server.

It has been forked from the **lita-hipchat** adapter, to use it with a regular XMPP server, and avoid all the HipChat specific handling.

## Installation

Add lita-xmpp to your Lita instance's Gemfile:

``` ruby
gem 'lita-xmpp'
```

## Configuration

These config settings are basically the same as you would put into your regular XMPP/Jabber client. A usual JID (Jabber ID) looks like `mr_bot@jabber.example.com`.

### Required attributes

* `jid` (String) - The JID of your robot's XMPP account.
* `password` (String) - The password for your robot's XMPP account.

### Optional attributes

* `server` (String) - The XMPP Server address. Override this if the bot has to connect to a specific host. Default: your JIDs hostname part
* `debug` (Boolean) - If `true`, turns on the underlying Jabber library's (xmpp4r) logger, which is fairly verbose. Default: `false`.
* **DEPRECATED** - `rooms` (Symbol, Array<String>) - An array of room JIDs that Lita should join upon connection. Can also be the symbol `:all`, which will cause Lita to discover and join all rooms. Default: `nil` (no rooms).
* `muc_domain` (String) - The XMPP Multi-User Chat domain to use. Default: `conference.<yourserver>`.
* `ignore_unknown_users` (Boolean) - TODO: review this Default: `false`.

There's no need to set `config.robot.mention_name` manually. The adapter will set the name to the username part of its JID.

### Example

``` ruby
Lita.configure do |config|
  config.robot.name = "Lita Bot"
  config.robot.adapter = :xmpp
  config.adapters.xmpp.jid = "lita@jabber.example.com"
  config.adapters.xmpp.password = "secret"
  config.adapters.xmpp.debug = true
  config.adapters.xmpp.rooms = :all
end
```

## Events

* `:connected` - When the robot has connected to XMPP. No payload.
* `:disconnected` - When the robot has disconnected from XMPP. No payload.
* `:joined` - When the robot joins a room. Payload: `:room`: The String room ID that was joined.
* `:parted` - When the robot parts from a room. Payload: `:room`: The String room ID that was parted from.

## Managing rooms

(TODO)

To make Lita join or part from rooms, use the [built-in `join` and `part` commands](http://docs.lita.io/getting-started/usage/#managing-rooms). For backwards compatibility, the `rooms` configuration attribute will be supported until lita-xmpp 4.0, but you should remove it and begin using the new command instead. If the configuration attribute is set, lita-xmpp will honor its value and join those rooms instead of the ones persisted to Redis from using the new commands.

## License

[MIT](http://opensource.org/licenses/MIT)
