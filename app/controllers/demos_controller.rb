require 'twilio-ruby'

class DemosController < ApplicationController
  before_action :set_demo, only: [:show, :edit, :update, :destroy]

  def initialize()
    account_sid = "AC86351090728f9e40a5f052248ba25ea3"
    auth_token = "94e08ce3a1c97e57207387a4df22fc38"

    @client = Twilio::REST::Client.new account_sid, auth_token

    Twilio.configure do |config|
      config.account_sid = account_sid
      config.auth_token = auth_token
    end
  end

  def index
    @demos = Demo.all
  end

  def home
  end

  def login
  end

  def success
  end

  # GET /demos/1
  # GET /demos/1.json
  def show
  end

  # GET /demos/new
  def new
    @demo = Demo.new
  end

  # GET /demos/1/edit
  def edit
  end

  # POST /demos
  # POST /demos.json
  def create
    @demo = Demo.new(demo_params)

    respond_to do |format|
      if @demo.save
        
        @client = Twilio::REST::Client.new
        @client.api.account.messages.create(
            from: "+16203495181", 
            to: "+573106322447",
            body: "#{@demo.description}")

        format.html { redirect_to success_path }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /demos/1
  # PATCH/PUT /demos/1.json
  def update
    respond_to do |format|
      if @demo.update(demo_params)
        format.html { redirect_to @demo, notice: 'Demo was successfully updated.' }
        format.json { render :show, status: :ok, location: @demo }
      else
        format.html { render :edit }
        format.json { render json: @demo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demos/1
  # DELETE /demos/1.json
  def destroy
    @demo.destroy
    respond_to do |format|
      format.html { redirect_to demos_url, notice: 'Demo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def demo_params
      params.require(:demo).permit(:description)
    end
end