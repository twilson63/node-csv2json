path = require 'path'
csv2json = require path.join(__dirname,'..')
fs = require 'fs'
#describe 'basic convert', ->
#  it 'should be successful', (done) ->
stream = fs.FileReadStream(path.join(__dirname,'data','sample.csv'))
stream.pipe(csv2json(["foo","bar","baz"]).pipe(process.stdout))
