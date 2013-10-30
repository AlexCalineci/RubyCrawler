class TestPostgresqlsController < ApplicationController
  before_action :set_test_postgresql, only: [:show, :edit, :update, :destroy]

  # GET /test_postgresqls
  # GET /test_postgresqls.json
  WillPaginate.per_page = 100

  def index
    @test_postgresqls = TestPostgresql.paginate(:page => params[:page]).order("created_at desc")
  end

  # GET /test_postgresqls/1
  # GET /test_postgresqls/1.json
  def show
  end

  # GET /test_postgresqls/new
  def new
    @test_postgresql = TestPostgresql.new
  end

  # GET /test_postgresqls/1/edit
  def edit
  end


  def populate
    #require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    #require 'mysql'
    url ='http://en.wikipedia.org/wiki/List_of_S%26P_500_companies'

    #SUBDIR = 'data-hold'
    #Dir.mkdir(SUBDIR) unless File.exists?SUBDIR

    #DBNAME = "#{SUBDIR}/mydb"
    #DB = MYSQL2::Database.new( DBNAME )
    
    rows = Nokogiri::HTML(open(url)).css('table.sortable tr')[1..-1]
    puts "Number of rows: #{rows.length}"
    rows.each do |row|
      tds = row.css('td').map{|td| td.text.strip}
      puts tds.join(", ")
    
    
      TestPostgresql.create(:content=>tds[4].to_s)
     
    
    end
  end
  # POST /test_postgresqls
  # POST /test_postgresqls.json
  def create
    @test_postgresql = TestPostgresql.new(test_postgresql_params)

    respond_to do |format|
      if @test_postgresql.save
        format.html { redirect_to @test_postgresql, notice: 'Test postgresql was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_postgresql }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_postgresql.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_postgresqls/1
  # PATCH/PUT /test_postgresqls/1.json
  def update
    respond_to do |format|
      if @test_postgresql.update(test_postgresql_params)
        format.html { redirect_to @test_postgresql, notice: 'Test postgresql was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_postgresql.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_postgresqls/1
  # DELETE /test_postgresqls/1.json
  def destroy
    @test_postgresql.destroy
    respond_to do |format|
      format.html { redirect_to test_postgresqls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_postgresql
      @test_postgresql = TestPostgresql.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_postgresql_params
      params.require(:test_postgresql).permit(:content)
    end
end
