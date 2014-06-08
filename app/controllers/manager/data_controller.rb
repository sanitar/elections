class Manager::DataController < Manager::ApplicationController
	def index
		@data = DataPacket.new
		@packets = DataPacket.order('created_at DESC').paginate(page: params[:page], per_page: 15)
	end

	def create
		@packet = DataPacket.create(data_params)
	end

	def import_packet
		@packet = DataPacket.find_by_id(params[:id])
		VotersImport.import @packet.id
		redirect_to manager_data_index_path
	end

	private

	def data_params
	  params.require(:data_packet).permit([:packet, :title])
	end
end
