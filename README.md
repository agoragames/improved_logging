# improved_logging

Improves the log format and adds an optional `exception` parameter to the 
`warn()` and `error()` methods to print a stack trace automatically.

## Installation

```ruby
gem 'improved_logging'
```

In your `application.rb`, include the following (or similar):

```ruby
config.logger = ActiveSupport::BufferedLogger.new(config.paths.log.first)
config.logger.level = Logger::DEBUG
```

## Configuration

By default it behaves differently in development mode, it doesn't log the time, 
process ID or hostname. If `Rails.env` is not `development` those will be logged.

There are some options that can be set, add these lines to an initializer:

`ImprovedLogging.verbose = false`

 * This suppresses printing of the hostname, process ID and timestamp. This 
defaults to false in development mode, true otherwise.

`ImprovedLogging.hostname_maxlen = 15`

 * This sets the maximum number of characters of the hostname that will be 
printed. The beginning of the hostname is truncated, rather than the end, 
because often the end of the hostname is more unique than the beginning. 
The default is 10.

`ImprovedLogging.custom = "my-custom-string"`

 * This sets a custom string that will be printed at the beginning of the 
output, if desired.

## Format

It adds severity level (with colour, if colour is enabled), hostname and 
process ID to each log line, and it and adds warn() and exception() methods that 
take an exception as an argument and print the stack trace.

Sample verbose output:

<pre>
fossil.4685  Started GET "/my-mlg?page=1&page_size=10&_=1314650041431" for 127.0.0.1 at 2011-08-29 16:34:01 -0400
fossil.4685  16:34:01  INFO       Processing by TimelineEventsController#personal_and_friends as JSON
fossil.4685  16:34:01  INFO       Parameters: {"page"=>"1", "page_size"=>"10", "_"=>"1314650041431"}
fossil.4685  16:34:01  DEBUG      User Load (0.4ms)  SELECT `users`.* FROM `users` WHERE `users`.`nickname` = 'AgoraDavid' LIMIT 1
fossil.4685  16:34:01  DEBUG      CACHE (0.0ms)  SELECT `users`.* FROM `users` WHERE `users`.`nickname` = 'AgoraDavid' LIMIT 1
fossil.4685  16:34:01  DEBUG      TimelineEvent Load (0.5ms)  SELECT `timeline_events`.* FROM `timeline_events` WHERE (actor_id IN (1)) ORDER BY updated_at DESC LIMIT 10 OFFSET 0
fossil.4685  16:34:01  DEBUG      SQL (0.2ms)  SELECT COUNT(*) FROM `votes` WHERE `votes`.`voteable_id` = 1 AND `votes`.`voteable_type` = 'TimelineEvent' AND `votes`.`vote` = 0
fossil.4685  16:34:01  INFO     Rendered shared/event_message_templates/_user_created.html.haml (1.7ms)
fossil.4685  16:34:01  DEBUG      User Load (0.3ms)  SELECT `users`.* FROM `users` WHERE `users`.`id` = 1 LIMIT 1
fossil.4685  16:34:01  DEBUG      SQL (0.4ms)  SELECT COUNT(*) FROM `comments` WHERE (`comments`.commentable_id = 1 AND `comments`.commentable_type = 'TimelineEvent')
fossil.4685  16:34:01  DEBUG      Comment Load (0.2ms)  SELECT `comments`.* FROM `comments` WHERE (`comments`.commentable_id = 1 AND `comments`.commentable_type = 'TimelineEvent')
fossil.4685  16:34:01  DEBUG      CACHE (0.0ms)  SELECT COUNT(*) FROM `comments` WHERE (`comments`.commentable_id = 1 AND `comments`.commentable_type = 'TimelineEvent')
fossil.4685  16:34:01  INFO     Rendered shared/event_message_templates/_new_comment_form.html.haml (8.2ms)
fossil.4685  16:34:01  INFO     Rendered shared/event_message_templates/_comments.html.haml (22.9ms)
fossil.4685  16:34:01  INFO     Rendered shared/event_message_templates/_message_template.html.haml (69.2ms)
fossil.4685  16:34:01  INFO     Rendered shared/feed.haml (72.6ms)
fossil.4685  16:34:01  INFO     Completed 200 OK in 246ms (Views: 3.4ms | ActiveRecord: 2.0ms)
</pre>

## Contributing to improved_logging

 * Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
 * Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
 * Fork the project
 * Start a feature/bugfix branch
 * Commit and push until you are happy with your contribution
 * Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
 * Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## License

Code originally found in https://github.com/pauldowman/better_logging

Uses the same license as better_logging, 
Creative Commons "Attribution-Share Alike", http://creativecommons.org/licenses/by-sa/3.0/
