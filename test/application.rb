# Plato::MrubyApplication class

assert('MrubyApplication', 'class') do
  assert_equal(Plato::MrubyApplication.class, Class)
end

assert('MrubyApplication', 'superclass') do
  assert_equal(Plato::MrubyApplication.superclass, Object)
end

assert('MrubyApplication', 'new') do
  Plato::MrubyApplication.new
end

assert('MrubyApplication', 'add_timer') do
  ts = Plato::Timer.class_variable_get(:@@timer)
  ts.clear
  app = Plato::MrubyApplication.new
  id = app.add_timer(100, Proc.new{|app| @v = 1})
  assert_equal(id, 1)
  assert_equal(ts.size, 1)
end

assert('MrubyApplication', 'delete_timer') do
  ts = Plato::Timer.class_variable_get(:@@timer)
  ts.clear
  app = Plato::MrubyApplication.new
  id0 = app.add_timer(100, Proc.new{|app| @v = 1})
  id1 = app.add_timer(200, Proc.new{|app| @v = 2})
  app.delete_timer(id0)
  id2 = app.add_timer(300, Proc.new{|app| @v = 3})
  ts[0].nil? && ts.size == 3 && id2 == 3
  assert_nil(ts[0])
  assert_equal(ts.size, 3)
  assert_equal(id2, 3)
end

assert('MrubyApplication', 'start/stop') do
  ts = Plato::Timer.class_variable_get(:@@timer)
  ts.clear
  app = Plato::MrubyApplication.new
  id = app.add_timer(100, Proc.new{|app| app.stop})
  t = Plato::Machine.millis
  app.start
  assert_true(Plato::Machine.millis >= t + 100)
end
