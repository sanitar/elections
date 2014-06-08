class DataPacket < ActiveRecord::Base
	
	has_attached_file :packet, :default_url => "/images/:style/missing.png"
	
	validates_attachment_presence :packet
	do_not_validate_attachment_file_type :packet

	validates :title, presence: true
	#attr_accessor :packet_file_name
end
