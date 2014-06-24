# == Schema Information
#
# Table name: data_packets
#
#  id                  :integer          not null, primary key
#  title               :string(255)
#  user_id             :integer
#  packet_file_name    :string(255)
#  packet_content_type :string(255)
#  packet_file_size    :integer
#  packet_updated_at   :datetime
#  created_at          :datetime
#  updated_at          :datetime
#  status              :integer          default(0)
#

class DataPacket < ActiveRecord::Base
	
	has_attached_file :packet, :default_url => "/images/:style/missing.png"
	
	validates :title, presence: true
	validates_attachment_presence :packet

	validates_attachment_content_type :packet,
                                    	:content_type => ["text/csv", "text/comma-separated-values"]


	#do_not_validate_attachment_file_type :packet

	

	
	#attr_accessor :packet_file_name
end
