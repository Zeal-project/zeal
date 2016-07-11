class ResumesController < ApplicationController

  def new
    @resume = current_user.resumes.new
  end

  def create
    @resume = current_user.resumes.new(resume_params)
    @resume.save

    redirect_to career_posts_path
  end

  def show
    @resumes = current_user.resumes
  end

  private

  def resume_params
    params.require( :resume ).permit( :ideal_role, :exp_in_role, :length_of_working_exp, :ideal_salary, :job_search_status, :reason_for_new_job )
  end
end
