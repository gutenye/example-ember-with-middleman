App.Router = Ember.Router.extend
  enableLogging: true

  showAll: Ember.Route.transitionTo('index')
  showActive: Ember.Route.transitionTo('active')
  showCompleted: Ember.Route.transitionTo('completed')

  root: Ember.Route.extend
    index: Ember.Route.extend
      route: "/"

      connectOutlets: (router, context) ->
        router.set("todosController.filterBy", "")
        router.get("applicationController").connectOutlet("todos", App.Todo.find())

    active: Ember.Route.extend
      route: "/active"

      connectOutlets: (router, context) ->
        router.set("todosController.filterBy", "active")
        todos = App.Todo.find().filterProperty("completed", false)
        router.get("applicationController").connectOutlet("todos", todos)

    completed: Ember.Route.extend
      route: "/completed"

      connectOutlets: (router, context) ->
        router.set("todosController.filterBy", "completed")
        todos = App.Todo.find().filterProperty("completed", true)
        router.get("applicationController").connectOutlet("todos", todos)
