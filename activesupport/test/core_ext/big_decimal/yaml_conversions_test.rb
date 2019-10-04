require 'abstract_unit'

class BigDecimalYamlConversionsTest < ActiveSupport::TestCase
  def test_to_yaml
    assert_deprecated { require 'active_support/core_ext/big_decimal/yaml_conversions' }
    assert_match("--- 100000.30020320320000000000000000000000000000001\n", BigDecimal('100000.30020320320000000000000000000000000000001').to_yaml)
    assert_match("--- .Inf\n",  BigDecimal('Infinity').to_yaml)
    assert_match("--- .NaN\n",  BigDecimal('NaN').to_yaml)
    assert_match("--- -.Inf\n", BigDecimal('-Infinity').to_yaml)
  end
end
