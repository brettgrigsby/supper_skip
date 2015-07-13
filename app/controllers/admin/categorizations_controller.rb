class Admin::CategorizationsController < AdminController
  def destroy
    Categorization.delete(params[:id])
    redirect_to :back
  end

  def create
    Categorization.create(item_id: params[:item], category_id: params[:category])
    redirect_to :back
  end
end

