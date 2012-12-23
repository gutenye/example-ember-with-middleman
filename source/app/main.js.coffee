#= require_self
#= require      ./local_storage_adapter
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./templates
#= require      ./routes

window.A = window.App = Ember.Application.create
  Store: DS.Store.extend
    revision: 10
    adapter: "App.LocalStorageAdapter"
