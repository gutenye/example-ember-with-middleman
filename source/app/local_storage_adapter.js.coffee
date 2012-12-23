App.LocalStorageAdapter = DS.Adapter.extend
  _data: JSON.parse(localStorage.getItem("todos") || "{}")

  _save: () ->
    localStorage.setItem("todos", JSON.stringify(@_data))

  createRecord: (store, type, record) ->
    data = @serialize(record)
    data["id"] = Date.now()
    @_data[data["id"]] = data

    @_save()
    store.didSaveRecord(record, data)

  createRecords: (store, type, records) ->
    data = []
    records.forEach (record) =>
      json = @serialize(record)
      json["id"] = Date.now()
      @_data[json["id"]] = json
      data.push(json)

    @_save()
    store.didSaveRecords(records, data);

  updateRecord: (store, type, record) ->
    data = @serialize(record, includeId: true)
    @_data[record.get("id")] = data

    @_save()
    store.didSaveRecord(record, data)

  updateRecords: (store, type, records) ->
    data = []
    records.forEach (record) =>
      json = @serialize(record, includeId: true)
      @_data[record.get("id")] = json
      data.push json

    @_save()
    store.didSaveRecords(records, data)

  deleteRecord: (store, tyoe, record) ->
    delete @_data[record.get("id")]

    @_save()
    store.didSaveRecord(record)

  deleteRecords: (store, type, records) ->
    records.forEach (record) =>
      delete @_data[record.get("id")]

    @_save()
    store.didSaveRecords(records)

  find: (store, type, id) ->
    data = @_data[id]

    store.load(type, id, data)

  findMany: (store, type, ids) ->
    data = []
    for id in ids
      data.push @_data[id]

    store.loadMany(type, ids, data)

  findAll: (store, type, since) ->
    data = []
    for id, record of @_data
      data.push record

    pd 1
    store.loadMany(type, data)
    pd 2
