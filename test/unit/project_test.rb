require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should be able to retrieve projects based on day" do
    actual = projects(:huddle).reports_grouped_by_day
    expected_keys = actual.keys.sort.map{ |d| d.to_s(:db) }
    assert_equal(["2012-07-15", "2012-07-16"], expected_keys)
    assert_equal([status_reports(:one_tue).id, status_reports(:two_tue).id],
        actual[Date.parse("2012-07-15")].map(&:id))
  end
end
