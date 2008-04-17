require 'test/unit'
require File.dirname(__FILE__) + '/../../../../config/boot.rb'
require File.dirname(__FILE__) + '/../../../../config/environment.rb'


class TitleHelperTest < Test::Unit::TestCase
  def setup
    @helper = ActionView::Base.new
  end
  
  # Replace this with your real tests.
  def test_title_method_with_no_title_set
    assert_equal "foobar", @helper.title(:site_name => 'foobar')
  end
   
  def test_title_method_with_a_title_set
    assert_equal "<h1>HomePage</h1>", @helper.title("HomePage")
    assert_equal "HomePage - foobar", @helper.title(:site_name => 'foobar')
  end
  
  def test_strip_tags
    assert_equal "<h1>This is <strong>GREAT</strong></h1>", @helper.title("This is <strong>GREAT</strong>")
    assert_equal "This is GREAT - foobar", @helper.title(:site_name => 'foobar')
  end
  
  def test_error_on_h1
    assert_equal "<h1 class=\"error\">This is wrong</h1>", @helper.title("This is wrong", :error => true)
  end
end
