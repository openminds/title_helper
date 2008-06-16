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
  
  def test_class_on_h1
    assert_equal "<h1 class=\"my-class\">Header with class</h1>", @helper.title("Header with class", :class => 'my-class')
  end
  
  def test_id_on_h1
    assert_equal "<h1 id=\"my-id\">Header with id</h1>", @helper.title("Header with id", :id => 'my-id')
  end
  
  def test_class_and_id_on_h1
    assert_equal "<h1 class=\"my-class\" id=\"my-id\">Header with class and id</h1>", @helper.title("Header with class and id", :class => 'my-class', :id => 'my-id')
  end
  
  def test_class_and_error_on_h1
    assert_equal "<h1 class=\"my-class error\">Header with error and class</h1>", @helper.title("Header with error and class", :class => 'my-class', :error => true)
  end
end
