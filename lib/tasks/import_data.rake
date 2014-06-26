namespace :elections do
    task :import_packets => :environment do
    	DataPacket.where(:status => 0).each do |p|
    		VotersImport.import p.id
    	end
    end
end