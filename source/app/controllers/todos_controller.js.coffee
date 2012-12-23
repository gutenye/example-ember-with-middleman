App.TodosController = Ember.ArrayController.extend
  content: []

  clearCompleted: (e) ->
    @filterProperty("completed", true).forEach( (record) ->
      record.deleteRecord()
    )
    App.store.commit()

  oneLeft: (() ->
    @get("remaining") == 1
  ).property("remaining")

  isAll: (() ->
    @get("filterBy") == ""
  ).property("filterBy")

  isActive: (() ->
    @get("filterBy") == "active"
  ).property("filterBy")

  isCompleted: (() ->
    @get("filterBy") == "completed"
  ).property("filterBy")

  noneLeft: (() ->
    @get("length") == 0
  ).property("length")

  remaining: (() ->
    @filterProperty("completed", false).get("length")
  ).property("@each.completed")

  completed: (() ->
    @filterProperty("completed", true).get("length")
  ).property("@each.completed")

  noneCompleted: ( ()->
    @get("completed") == 0
  ).property("completed")

  allAreDone: ((key, value) ->
    if value != undefined
      @setEach("completed", value)
      return value
     else 
      return !!@get("length") && @everyProperty("completed", true)
  ).property("@each.completed")
