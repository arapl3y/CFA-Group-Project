require 'test/unit'
require_relative 'Trentr-agency'

class AgencyTest < Test::Unit::TestCase
  def test_agency
    agency_test = Agency.new('London?', 'Trent Upon Avon')

    assert_equal('London?', agency_test.questions)
    assert_equal('Trent Upon Avon', agency_test.person_list)
  end

  def test_agency_2
    agency_test_2 = Agency.new('Paris?', 'Trenoir')

    assert_equal('Paris?', agency_test_2.questions)
    assert_equal('Trenoir', agency_test_2.person_list)
  end
end
