(function() {
  var pd, root,
    __slice = Array.prototype.slice;

  root = typeof global !== "undefined" && global !== null ? global : this;

  pd = function() {
    var args;
    args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    pd.history.push(args);
    if (root.console) return console.log.apply(console, args);
  };

  pd.history = [];

  root['pd'] = pd;

}).call(this);
