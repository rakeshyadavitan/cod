class PurchasesController < ApplicationController

  def create

    user = User.order("RANDOM()").first
    purchase = user.purchases.build(purchase_params)

    if purchase.save
      render json: purchase, status: 201
    else
      render json: { errors: purchase.errors }, status: 422
    end

  end

  private

    def purchase_params
      params.require(:purchase).permit(:purchaseable_type, :purchaseable_id, :price, :video_quality)
    end

end
