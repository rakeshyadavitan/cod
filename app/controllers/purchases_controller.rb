class PurchasesController < ApplicationController

  def create

    user = User.order("RANDOM()").first
    user_purchases = user.purchases
    existing_purchase = user_purchases
                          .where(price: params[:price], video_quality: params[:video_quality], purchaseable_type: params[:purchaseable_type], purchaseable_id: params[:purchaseable_id])
                          .where("purchases.created_at < ?", 2.days.ago).first

    if existing_purchase.present?
      existing_purchase.created_at = Time.now
      if existing_purchase.save
        render json: existing_purchase
      else
        json_error(existing_purchase)
      end
    else
      purchase = user_purchases.build(purchase_params)      
      if purchase.save
        render json: purchase, status: 201
      else
        json_error(purchase)
      end
    end
    
  end

  private

    def purchase_params
      params.require(:purchase).permit(:purchaseable_type, :purchaseable_id, :price, :video_quality)
    end

    def json_error(purchase)
      render json: { errors: purchase.errors }
    end

end
