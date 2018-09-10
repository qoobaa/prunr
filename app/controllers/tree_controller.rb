class TreeController < ApplicationController
  def show
    tree = FetchTree.call(params[:name])
    return head :not_found if tree.nil?
    return render json: tree if indicator_ids.nil?
    render json: FilterThemesByIndicatorIds.call(tree, indicator_ids)
  end

  private

  def indicator_ids
    params[:indicator_ids].map(&:to_i) if params.key?(:indicator_ids)
  end
end
