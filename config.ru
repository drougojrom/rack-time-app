require_relative 'app'
require_relative 'middleware/runtime'
require_relative 'middleware/logger'

use Runtime
use AppLogger, logger: File.expand_path('log/app.log', __dir__)
run App.new
