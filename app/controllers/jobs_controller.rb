class JobsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :index_category

  def new
    @job = Job.new
    @company = Company.new
  end

  def show
    @category=Category.all.order(created_at: :desc)
    @job = Job.find(params[:id])
    @job_id=Job.find_by(id: params[:id])
    @company=Company.where(job_id: @job_id)
  end

  def index
    if params[:kategorije]
      @category_id=Category.find_by(id: params[:kategorije])
      @company = Company.all.order(created_at: :desc)
      @job=Job.where(category_id: @category_id)
    else
      @company = Company.all.order(created_at: :desc)
      @job=Job.all
    end
    if params[:search]
      if Company.where("name LIKE ? ", "%#{params[:search]}%").count > 0
        @company = Company.where("name LIKE ? ", "%#{params[:search]}%")
        @job=Job.all.order(created_at: :desc)
      else
        @company = Company.all.order(created_at: :desc)
        @job = Job.where("title LIKE ? ", "%#{params[:search]}%")
      end
    end
  end

  def create
      @job=Job.new(job_params)
      @job.save
      @company=Company.new(company_params)
      @company.job_id=@job.id
      if @company.save
        flash[:notice]="Job was successfully created"
        redirect_to jobs_path
      else
        render 'new'
      end
  end

  private

  def job_params
    params.permit(:title,:category_id,:jobtype,:headquarter,:region,:applylink,:description)
  end

  def company_params
    params.permit(:name,:company_statement,:url,:email,:company_description,:image)
  end

  def index_category
    @category=Category.all
  end
end
