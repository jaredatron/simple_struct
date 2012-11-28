class SimpleStruct

  VERSION = "0.0.3"

  def self.new *members, &block
    subclass = Class.new(self)
    subclass.define_singleton_method(:new, self.superclass.method(:new))
    subclass.define_singleton_method(:members){ members }
    subclass.class_eval(&block) if block_given?
    subclass
  end

  def initialize *args
    self.class.members.zip(args).each do |member, value|
      instance_variable_set(:"@#{member}", value)
    end
  end

  def self.inspect
    return super unless self.respond_to?(:members)
    %[#{to_s}(#{members*', '})]
  end

  def inspect
    members = self.class.members.map do |member|
      member.to_s + '=' + instance_variable_get("@#{member}").inspect
    end
    %(#<#{self.class}: #{members.join(', ')}>)
  end

end


eval <<-RUBY if $0 == __FILE__

require 'test/unit'


class MethodObjectTestUnitTestCase < Test::Unit::TestCase

  def test_class_is_subclass_of_SimpleStruct
    car_class = SimpleStruct.new(:color, :size){
      attr_accessor :color
    }
    car_instance = car_class.new('red', 42)

    assert_equal car_class.superclass, SimpleStruct
    assert_equal car_class.members, [:color, :size]
    assert car_instance.public_methods.include?(:color)
    assert car_instance.public_methods.include?(:color=)
    assert !car_instance.public_methods.include?(:size)
    assert !car_instance.public_methods.include?(:size=)
    assert car_instance.is_a?(SimpleStruct), "Car is not a SimpleStruct"
  end

end


if ENV['BENCHMARK']

  require 'benchmark'

  ITERATIONS = 100_000

  Benchmark.bmbm do |benchmark|
    benchmark.report("Struct.new(:color, :size)") do
      ITERATIONS.times do
        Struct.new(:color, :size)
      end
    end

    benchmark.report("SimpleStruct.new(:color, :size)") do
      ITERATIONS.times do
        SimpleStruct.new(:color, :size){}
      end
    end

  end

end

RUBY
