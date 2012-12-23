App.Todo = DS.Model.extend
  title: DS.attr("string")
  completed: DS.attr("boolean", default: false)

  todoChanged: (() ->
    App.store.commit()
  ).observes("title", "completed")
