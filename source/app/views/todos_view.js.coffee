App.TodosView = Ember.View.extend
  templateName: "todos"

  oneLeft: (() ->
    @get("controller.remaining") == 1
  ).property("controller.remaining")

  isAll: (() ->
    Ember.empty(@get("controller.filterBy"))
  ).property("filter")

  isActive: (() ->
    @get("controller.filterBy") == "active"
  ).property("filter")

  isCompleted: (() ->
    @get("controller.filterBy") == "completed"
  ).property("filter")

  CreateTodoView: Ember.TextField.extend
    insertNewline: () ->
      value = @get("value")
      if value 
        App.Todo.createRecord({title: value})
        App.store.commit()
        @set("value", "")

  EntryView: Ember.View.extend
    doubleClick: (e) ->
      @get("content").set("editing", true)

    removeItem: (e) ->
      e.context.deleteRecord()
      App.store.commit()

  ItemEditorView: Ember.TextField.extend
    valueBinding: "content.title"
    classNames: ["edit"]

    change: () ->
      if Ember.empty(@get("content.title"))
        @get("controller").removeObject(@get("content"))
      else
        @get("content").set("title", @get("content.title").trim())

    whenDone: () ->
      @get("content").set("editing", false)

    focusOut: () ->
      @whenDone()
    
    didInsertElement: () ->
      @$().focus()
    
    insertNewline: () ->
      @whenDone()
