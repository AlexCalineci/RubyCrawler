class TestMysqlsController < ApplicationController
  before_action :set_test_mysql, only: [:show, :edit, :update, :destroy]

  # GET /test_mysqls
  # GET /test_mysqls.json
  WillPaginate.per_page = 100


  def index
    @test_mysqls = TestMysql.paginate(:page => params[:page]).order("created_at desc")
  end



  def populate
    #require 'rubygems'
   # require 'nokogiri'
    require 'open-uri'
    #require 'mysql'
    url='http://en.wikipedia.org/wiki/List_of_S%26P_500_companies'

    #SUBDIR = 'data-hold'
    #Dir.mkdir(SUBDIR) unless File.exists?SUBDIR

    #DBNAME = "#{SUBDIR}/mydb"
    #DB = MYSQL2::Database.new( DBNAME )
    
    rows = Nokogiri::HTML(open(url)).css('table.sortable tr')[1..-1]
    puts "Number of rows: #{rows.length}"
    rows.each do |row|
      tds = row.css('td').map{|td| td.text.strip}
      puts tds.join(", ")
      TestMysql.create(:content=>tds[4].to_s)
      #tds[4] = '1'
      #sql = "INSERT INTO test_mysqls(content) VALUES("+'"'+tds[4].to_s+'"'+")"
      #sql2 = "INSERT INTO test_postgresqls(content) VALUES("+'"'+tds[4].to_s+'"'+")"
 
     # ActiveRecord::Base.connection.execute(sql)
     #ActiveRecord::Base.connection.execute(sql2)
     #ActiveRecord::Base.connection.execute(sql)
    
    end
  end

  # GET /test_mysqls/1
  # GET /test_mysqls/1.json
  def show
  end

  # GET /test_mysqls/new
  def new
    @test_mysql = TestMysql.new
  end

  # GET /test_mysqls/1/edit
  def edit
  end

  # POST /test_mysqls
  # POST /test_mysqls.json
  def create
    @test_mysql = TestMysql.new(test_mysql_params)

    respond_to do |format|
      if @test_mysql.save
        format.html { redirect_to @test_mysql, notice: 'Test mysql was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_mysql }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_mysql.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_mysqls/1
  # PATCH/PUT /test_mysqls/1.json
  def update
    respond_to do |format|
      if @test_mysql.update(test_mysql_params)
        format.html { redirect_to @test_mysql, notice: 'Test mysql was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_mysql.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_mysqls/1
  # DELETE /test_mysqls/1.json
  def destroy
    @test_mysql.destroy
    respond_to do |format|
      format.html { redirect_to test_mysqls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_mysql
      @test_mysql = TestMysql.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_mysql_params
      params.require(:test_mysql).permit(:content)
    end
end
