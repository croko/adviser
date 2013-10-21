class Admin::DashboardController < Admin::BaseController
  skip_load_and_authorize_resource

  def index
    authorize! :read, :dashboard
    start_date = params[:start_date].present? ? Date.parse(params[:start_date]) : Date.today - 7.days
    end_date = params[:end_date].present? ? Date.parse(params[:end_date]) : Date.today
    @data = []

    (start_date...end_date).each do |day|
      registrations = User.stat(day).count
      doctors = Doctor.stat(day).count
      clinics = Clinic.stat(day).count
      advises = Advise.stat(day).count
      @data << {date: day, doctors: doctors, clinics: clinics, registrations: registrations, advises: advises}
    end

    @data = @data.to_json
    analytic_interval
    @users = User.all.size
    @doctors = Doctor.all.size
    @clinics = Clinic.all.size
  end

  def analytic_interval
    authorize! :read, :dashboard
    end_date = Date.today
    start_date = Date.today - params[:days].to_i.days

    @interval_registrations = User.stat_interval(start_date, end_date).size
    @interval_doctors = Doctor.stat_interval(start_date, end_date).size
    @interval_clinics = Clinic.stat_interval(start_date, end_date).size
    @interval_advises = Advise.stat_interval(start_date, end_date).size
  end

end
