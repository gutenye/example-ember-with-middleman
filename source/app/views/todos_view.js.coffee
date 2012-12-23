App.TodosView = Ember.View.extend
  templateName: "todos"

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

      change: () ->
        value = @get("value").trim()

        if value == ""
          @get("content").deleteRecord()
        else
          @get("content").set("title", value)

        App.store.commit()

      insertNewline: () ->
        @whenDone()

      focusOut: () ->
        @whenDone()
      
      didInsertElement: () ->
        @$().focus()
      
      whenDone: () ->
        @get("content").set("editing", false)
