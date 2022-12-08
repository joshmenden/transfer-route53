#!/usr/bin/env ruby

require "aws-sdk-route53"

ARGV.each_with_index do |val, index|
    OLD_HZ_ID = val if index == 0
    NEW_HZ_ID = val if index == 1
end

client = Aws::Route53::Client.new(region: "us-east-1")
old_records = client.list_resource_record_sets({hosted_zone_id: OLD_HZ_ID})
new_records = old_records.resource_record_sets.reject {|r| r.type == "NS" || r.type == "SOA" }
new_records.map! {|r| { action: "CREATE", resource_record_set: r.to_h} }
params = { change_batch: { changes: new_records }, hosted_zone_id: NEW_HZ_ID }
response = client.change_resource_record_sets(params)

puts "Records are being created in Hosted Zone #{NEW_HZ_ID}!"