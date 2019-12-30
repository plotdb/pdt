require! <[fs papaparse]>

pdString = do
  name: \String, default: "", level: 2
  basetype: []
  test: (-> true)
  parse: -> it or ""

pdNumber = do
  name: \Number, default: 0, level: 8
  test: -> !isNaN(+("#{it or ''}".replace(/,/g,'').replace(/%$/,'')))
  parse: ->
    if typeof(it) == \string =>
      it = parseFloat(it.replace(/,/g,''))
      if /%$/.exec(it) => it = (+it.replace(/%$/,''))/100
    +it
  order: do
    Ascending: ((a,b) -> a - b)
    Descending: ((a,b) -> b - a)
    index: -> it

types = [pdString, pdNumber]

guess = (dim) ->
  ret = types.map (t) -> [t, dim.filter(-> t.test it).length / (dim.length or 1)]
  ret.sort (a,b) -> b.1 - a.1

parse = (name) -> new Promise (res, rej) ->
  _ = (raw) ->
    data = raw.data
    data = data.filter -> it.filter(-> it).length
    data.splice 0, 2
    header = data.splice(0, 1).0
    rows = []
    for i from 1 til data.length =>
      d = data[i]
      obj = {}
      for j from 0 til header.length =>
        obj[header[j]] = d[j]
      rows.push obj
    dims = {}
    for j from 0 til header.length =>
      obj = []
      for i from 0 til data.length =>
        obj.push data[i][j]
      dims[header[j]] = obj
    return {rows, dims, raw}
  papaparse.parse fs.read-file-sync(name).toString!, do
    complete: -> res _(it)

parse \data/高中職以上學校學生就學貸款統計.csv
  .then (ret) ->
    dims = ret.dims
    for k,v of dims =>
      ts = guess v
      console.log k, ts.map(-> "#{it.0.name} #{it.1}").join(' / ')
  .catch (e) ->
