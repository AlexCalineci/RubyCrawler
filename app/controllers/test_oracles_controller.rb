class TestOraclesController < ApplicationController
  before_action :set_test_oracle, only: [:show, :edit, :update, :destroy]

  # GET /test_oracles
  # GET /test_oracles.json
  WillPaginate.per_page = 100

  def index
    @test_oracles = TestOracle.paginate(:page => params[:page]).order("created_at desc")
  end

  # GET /test_oracles/1
  # GET /test_oracles/1.json
  def show
  end

  # GET /test_oracles/new
  def new
    @test_oracle = TestOracle.new
  end

  # GET /test_oracles/1/edit
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
    
    
      TestOracle.create(:content=>tds[4].to_s)
    
    
    end
  end

  # POST /test_oracles
  # POST /test_oracles.json
  def create
    @test_oracle = TestOracle.new(test_oracle_params)

    respond_to do |format|
      if @test_oracle.save
        format.html { redirect_to @test_oracle, notice: 'Test oracle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_oracle }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_oracle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_oracles/1
  # PATCH/PUT /test_oracles/1.json
  def update
    respond_to do |format|
      if @test_oracle.update(test_oracle_params)
        format.html { redirect_to @test_oracle, notice: 'Test oracle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_oracle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_oracles/1
  # DELETE /test_oracles/1.json
  def destroy
    @test_oracle.destroy
    respond_to do |format|
      format.html { redirect_to test_oracles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_oracle
      @test_oracle = TestOracle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_oracle_params
      params.require(:test_oracle).permit(:content)
    end
end
