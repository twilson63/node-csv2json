[![build status](https://secure.travis-ci.org/twilson63/node-csv2json.png)](http://travis-ci.org/twilson63/node-csv2json)
# csv2json = CSV to JSON Stream Parser

Stream csv data and convert to json data

# Usage

``` javascript
var csv2json = require('csv2json'),
  columns = ['foo','bar','baz'];

process.openStdin().pipe(csv2json(columns).pipe(process.stdout));
```

``` coffeescript
csv2json = require 'csv2json'
columns = ['foo','bar','baz']

process.openStdin().pipe csv2json(columns).pipe(process.stdout)
```

# API

## var csv2json = require('csv2json')

---

### parameters

- columns

Array of column names for each row that will be set as the json keys

- columnSeparator (default ',')

The column separator for your csv file

- rowSeparator (default '\n')

The row separator for you csv file

## var parseRow = require('csv2json').parseRow;

---


- columns

Array of column names for each row that will be set as the json keys

- columnSeparator (default ',')

The column separator for your csv file

example

# example.js
``` javascript
var es = require('event-stream'),
    parseRow = require('csv2json').parseRow;

es.pipe(
  es.openStdin(),
  es.split(),
  parseRow(['foo','bar','baz']),
  es.join(','),
  process.stdout
);

```

``` sh
echo "'baz','bar','foo'" | node example.js
```

## License

MIT

## Contribute

pull requests are welcome

## Thanks

* [Event Stream](https://github.com/dominictarr/event-stream)
* [NodeJs](http://nodejs.org)
* [CoffeeScript](http://coffeescript.org) 
