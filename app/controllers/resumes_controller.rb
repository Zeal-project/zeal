class ResumesController < ApplicationController

  def new
    redirect_to resume_path(current_user.resume) if current_user.resumes.present?
    @resume = current_user.resumes.new
  end

  def my_resume
    redirect_to new_resume_path unless current_user.resumes.present?
    @resume = current_user.resumes.last
  end

  def create
    @resume = current_user.resumes.new(resume_params)
    if @resume.save
      redirect_to my_resume_path
    else
      flash[:alert] = @resume.errors.full_messages.join(" , ")
      render action: :new
    end
  end

  def update
    @resume = current_user.resumes.new(resume_params)
    @resume.save

    redirect_to my_resume_path
  end

  def edit_my_resume
    redirect_to new_resume_path unless current_user.resumes.present?
    @resume = current_user.resumes.last
  end

  private

  def resume_params
    params.require( :resume ).permit( :ideal_role, :exp_in_role, :length_of_working_exp, :ideal_salary, :job_search_status, :reason_for_new_job )
  end
end
