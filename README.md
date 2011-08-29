# improved_logging

## Installation

```ruby
gem 'improved_logging'
```

## Configuration

By default it behaves differently in development mode, it doesn't log the time, 
process ID or hostname. If RAILS_ENV is not "development" those will be logged.

There are some options that can be set, add these lines to an initializer:

@ImprovedLogging.verbose = false@
* This suppresses printing of the hostname, process ID and timestamp. This 
defaults to false in development mode, true otherwise.

@ImprovedLogging.hostname_maxlen = 15@
* This sets the maximum number of characters of the hostname that will be 
printed. The beginning of the hostname is truncated, rather than the end, 
because often the end of the hostname is more unique than the beginning. 
The default is 10.

@ImprovedLogging.custom = "my-custom-string"@
* This sets a custom string that will be printed at the beginning of the 
output, if desired.

## License

Code originally found in https://github.com/pauldowman/better_logging
Uses the same license as better_logging, 
Creative Commons "Attribution-Share Alike", http://creativecommons.org/licenses/by-sa/3.0/

## Note on Patches/Pull Requests

 * Fork the project.
 * Make your feature addition or bug fix.
 * Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
 * Send me a pull request.