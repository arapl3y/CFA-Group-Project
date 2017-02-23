require 'test/unit'
require_relative 'Trentr-people'

class PeopleTest < Test::Unit::TestCase
  def test_people_class
    test_people = People.new('Trent Upon Avon', 'London', 'Chap')

    assert_equal('Trent Upon Avon', test_people.name)
    assert_equal('London', test_people.origin)
    assert_equal('Chap', test_people.description)
  end

  def test_people_class2
    test_people_2 = People.new('Trenoir', 'Paris', 'Bonjour')

    assert_equal('Trenoir', test_people_2.name)
    assert_equal('Paris', test_people_2.origin)
    assert_equal('Bonjour', test_people_2.description)
  end
end
