class MedicalRecordsController < ApplicationController
  before_action :set_medical_record, only: [:show, :edit, :update, :destroy]

  
  def index
    @medical_records = MedicalRecord.all
  end

  
  def show
  end

  
  def new
    @medical_record = current_doctor.medical_records.build
  end

 
  def edit
  end

 
  def create
    @medical_record = current_doctor.medical_records.build(medical_record_params)

    respond_to do |format|
      if @medical_record.save
        format.html { redirect_to @medical_record, notice: 'Medical record was successfully created.' }
        format.json { render :show, status: :created, location: @medical_record }
      else
        format.html { render :new }
        format.json { render json: @medical_record.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @medical_record.update(medical_record_params)
        format.html { redirect_to @medical_record, notice: 'Medical record was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_record }
      else
        format.html { render :edit }
        format.json { render json: @medical_record.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @medical_record.destroy
    respond_to do |format|
      format.html { redirect_to medical_records_url, notice: 'Medical record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    
    def set_medical_record
      @medical_record = MedicalRecord.find(params[:id])
    end

    def medical_record_params
      params.require(:medical_record).permit(:patient_id, :doctor_id, :weight, :triglycerides, :glycated_hemoglobin, :cholesterol, :systolic, :diastolic, :height, :bmi)
    end
end
