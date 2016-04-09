require 'waitutil'

module TestWorld
  def testapp
    @app
  end

end

World(TestWorld)