# GeoblacklightMessaging

[![Build Status](https://travis-ci.org/eliotjordan/geoblacklight-messaging.svg?branch=master)](https://travis-ci.org/eliotjordan/geoblacklight-messaging) | [![Coverage Status](https://img.shields.io/coveralls/eliotjordan/geoblacklight-messaging.svg)](https://coveralls.io/r/eliotjordan/geoblacklight-messaging?branch=coveralls) | [![Gem Version](https://img.shields.io/gem/v/geoblacklight_messaging.svg)](https://github.com/eliotjordan/geoblacklight-messaging/releases)

GeoblacklightMessaging is a plugin that enables Geoblacklight applications to synchronize with external services using a RabbitMQ exchange. The plugin subscribes to events on the exchange and updates Geoblacklight records when they're created, updated, or deleted.


## Dependencies

- [RabbitMQ](https://www.rabbitmq.com/download.html)

## Installation

Add this line to your Geoblacklight application's Gemfile:

```ruby
gem 'geoblacklight_messaging'
```

And then execute:

    $ bundle
    
Run generator:

```
$ rails generate geoblacklight_messaging:install
```

Configure the events settings in `config/messaging.yml`:

```yaml
defaults: &defaults
  events:
    server: <%= ENV['RABBIT_SERVER'] || 'amqp://localhost:5672' %>
    exchange:
      geoblacklight: 'gbl_events'
```

## Usage

1. Start RabbitMQ:

   ```
   $ rabbitmq-server
   ```

1. Run your geoblacklight application:
	
	```
	$ rake geoblacklight:server
	```

1. In a separate console, run:
   
   ```
   $ WORKERS=GeoblacklightMessaging::GeoblacklightEventHandler rake sneakers:run
   ```

1. If the RabbitMQ Management Plugin is installed, you can inspect the exchange and publish messages manually using the web interface at `http://localhost:15672/`.

## Message Format

### Create

1. The event workers expect a json create message in the following format:

	```json
	{
	  "id": "princeton-abc123",
	  "event": "CREATED",
	  "doc": { "layer_slug_s": "princeton-abc123", "dc_title_s": "Cool Map", ... }
	}
	```

1. `id` is the record's unique key. `layer_slug_s` in this case.
1. `doc` is the unescaped geoblacklight json document.


### Update

1. Update is similar to create.

	```json
	{
	  "id": "princeton-abc123",
	  "event": "UPDATED",
	  "doc": { "layer_slug_s": "princeton-abc123", "dc_title_s": "New Map Name", ... }
	}
	```

### Delete

1. No doc value is needed for delete:

	```json
	{
	  "id": "princeton-abc123",
	  "event": "DELETED",
	}
	```
