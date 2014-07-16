class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  
  def index
    @records = current_doctor.records
  end

  def show
  end

  
  def new
    @patient = Patient.find(params[:patient_id])
    @record = current_doctor.records.build
  end

 
  def edit
  end

 
  def create
    binding.pry
    @record = current_doctor.records.build(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Medical record was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Medical record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Medical record was successfully destroyed.' }
    end
  end

  def d3_data 
    patient = Patient.find(params[:patient_id])
    data = patient.record.map do |record| 
      hash = {}
      hash[:cholesterol] = record.cholesterol
      hash[:whatever] = record.whatever
      
    end
    render json: patient.records
  end

  private
    
    def set_record
      @record = Record.find(params[:id])
    end

    def record_params
      params.require(:record).permit(:patient_id, :doctor_id, :weight, :triglycerides, :glycated_hemoglobin, :cholesterol, :systolic, :diastolic, :height, :bmi)
    end
end
