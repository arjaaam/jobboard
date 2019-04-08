require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest

      test "should page exist" do
        get new_job_path
        assert_response :success
      end

      test "should other page exist" do
        get jobs_path
        assert_response :success
      end

     test "should show page exist" do
        get show_path
        assert_response :success
      end

      def setup
        @category=Category.new()
        @job=Job.new()
        @company=Company.new()
      end

     test "create jobs with valid information" do
        get new_job_path
        file = fixture_file_upload(Rails.root.join('public', 'Logo_TV_2015.svg.png'), 'image/png')
        post '/jobs#create', params: { job: { title: "Designer", category_id: "1",jobtype:"Full time",headquarter:"Jablanica",region:"HNK",apply_link: "https://www.facebook.com",description: "Probni opis za testoranje ove aplikacija da li je uredu ili nije" },
                            company:{  name: "Wizard Health", company_statement: "No problemo, no problemo", url: "https://www.weworkremotely.com", email: "test@gmail.com",company_description: "Testtestetestetestetesteteste testetetetetetetetetet testetetetetetetetetettestetetetetetetetetet" } }
        @company.job_id=@job.id
        post '/jobs#create', params: { post: { image: file }}
        assert_template :new
    end

end
