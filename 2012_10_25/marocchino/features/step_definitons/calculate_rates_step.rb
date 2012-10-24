# encoding: utf-8
begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'calculate_rate'

Before do
end

After do
end

Given /^계산기에 (.*)을 입력했음$/ do |n|
  @result = calculate_rate(n)
end

Then /^화면에 출력된 결과는 (.*)이다$/ do |result|
  @result.should == result.to_f
end

Then /^화면에 에러가 발생한다$/ do
  @result.should == :error
end
