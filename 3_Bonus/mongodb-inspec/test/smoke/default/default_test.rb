# # encoding: utf-8

# Inspec test for recipe mongb-inspec::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.

 
describe command('mongo') do
    its('stdout') { should match /^MongoDB shell version: 2.6.12/ }
  end
