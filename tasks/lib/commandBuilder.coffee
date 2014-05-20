exports.build = ->
  if @config.composerLocation
    composerLocation = @config.composerLocation
  else
    composerLocation = 'composer';
  if @config.usePhp
    return "php#{this._getPhpOptions()} #{composerLocation} " + @command + this._getFlags()
  "#{composerLocation} " + @command + this._getFlags()

exports.withConfig = (config) ->
  @config = config
  this

exports.withFlags = (flags) ->
  @flags = flags
  this

exports.withCommand = (command) ->
  @command = command
  this

exports.reset = ->
  @command = null
  @flags = null
  @config = null

exports._getFlags = ->
  if @flags
    @compressedFlags = "";
    for flag in @flags
      @compressedFlags += ' --' + flag
    return @compressedFlags
  ""

exports._getPhpOptions = ->
  phpOptions = @config.phpArgs
  if phpOptions
    compressedOptions = "";
    for option, value of phpOptions
      compressedOptions += " -D#{option}=#{value}"
    return compressedOptions
  ""