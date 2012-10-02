path = require 'path'
csv2json = require path.join(__dirname,'..')
fs = require 'fs'
es = require 'event-stream'
assert = require 'assert'

describe 'basic convert', ->
  it 'should be successful', (done) ->
    es.pipeline(
      fs.FileReadStream(path.join(__dirname,'data','sample.csv'))
      csv2json(["col1","col2","col3"])
      fs.FileWriteStream(path.join(__dirname,'data','sample.json'))
      es.writeArray (err, array) ->
        console.dir(array)
        done()
    )

    
    #stream = fs.FileReadStream(path.join(__dirname,'data','sample.csv'))
    #stream.pipe(csv2json(["col1","col2","col3"])).pipe(process.stdout)
