
class ParcelsController < ApplicationController
  def index
    @parcels = Parcel.all
  end

  def show
    @parcel = Parcel.find(params[:id])
  end

  def new
    @parcel = Parcel.new
  end

  def create

    @title = params.dig(:parcel, :title)
    @first_name = params.dig(:parcel, :first_name)
    @last_name = params.dig(:parcel, :last_name)
    @middle_name = params.dig(:parcel, :middle_name)
    @email = params.dig(:parcel, :email)
    @phone = params.dig(:parcel, :phone)
    @weight = params.dig(:parcel, :weight)
    @length = params.dig(:parcel, :length)
    @width = params.dig(:parcel, :width)
    @height = params.dig(:parcel, :height)
    @origin = params.dig(:parcel, :origin)
    @destination = params.dig(:parcel, :destination)
    @transport = TransportPrice.new(@weight,@length,@width,@height,@origin,@destination).price()
    @distance = @transport.dig(:distance)
    @price = @transport.dig(:price)

    if @distance == 0 || @price == 0
      @distance = ''
      @price = ''
    end

    @parcel = Parcel.new(parcel_params)


  if @parcel.save
      redirect_to @parcel
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def parcel_params
    params
      .require(:parcel)
      .merge(distance:@distance,price:@price)
      .permit(
        :title,
        :first_name,
        :last_name,
        :middle_name,
        :email,:phone,
        :weight,:width,
        :length,:height,
        :origin,:destination,
        :distance,:price)
  end
end
