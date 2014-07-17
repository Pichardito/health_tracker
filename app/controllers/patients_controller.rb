class PatientsController < ApplicationController


	def index
	end

	def show
		@patient = Patient.find(params[:id])
	end

	def new
		@patient = Patient.new
	end

	def edit
		@patient = Patient.find(params[:id])
	end


	def create
		patient = Patient.create(patient_params)
		record = Record.create()
		record.doctor = current_doctor
		record.patient = patient
		record.save
		redirect_to '/list-of-patients'
	end


	def update
		patient = Patient.find(params[:id])
    respond_to do |format|
      if patient.update(patient_params)
        format.html { redirect_to '/', notice: 'Patient was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

	def destroy
		patient = Patient.find(params[:id])
		patient.destroy
		respond_to do |format|
      	format.html { redirect_to '/list-of-patients', notice: 'Patient was successfully destroyed.' }
    end
	end



	private

	def patient_params
		params.require(:patient).permit(:name, :city)
	end

end



