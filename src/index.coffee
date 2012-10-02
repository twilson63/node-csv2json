# csv2json stream parser
es = require 'event-stream'

tidy = (field) -> field?.trim().replace(/^\"/, '').replace(/\"$/,'').trim()
# merge arrays into an object
merge = (keys, values) ->
  output = {}
  output[tidy(key)] = tidy(values[i]) for key, i in keys
  output

# if you aready have a single record
# you can just pipe to csv2json.parseRow
exports.parseRow = parseRow = (columns, sep=',') ->
  es.map (data, cb) ->
    record = merge columns, data.toString().split(sep)
    cb null, JSON.stringify(record)
  
# main stream to receive a set of csv data and 
# produce an comma delimited list of json.
module.exports = csv2json = (columns, row='\n', col=',') ->
  unless columns?
    throw new Error('columns must be defined.')
  es.pipe(
    es.split(row)
    parseRow(columns, col)
    es.join(',')
  )
