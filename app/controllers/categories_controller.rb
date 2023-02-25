class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show destroy]

  # GET /categories or /categories.json
  def index
    @categories = current_user.categories.all
  end

  # GET /categories/1 or /categories/1.json
  def show; end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.new(category_params)
    @category.user_id = current_user.id

    respond_to do |format|
      if @category.save
        group = expense_params[:group_ids][1]
        format.html { redirect_to group_path(group), notice: 'Transaction was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    group = Group.find(params[:group_id])

    respond_to do |format|
      format.html { redirect_to group_path(group), notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # set relationship with groups
  def group_category_params
    params.require(:category).permit(:group_id)
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :amount, { group_ids: [] })
  end
end
