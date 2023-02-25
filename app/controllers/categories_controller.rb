class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show; end

  # GET /categories/new
  def new
    @category = Category.new
    @groups = current_user.groups
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.new(category_params)
    @category.user_id = current_user.id

    respond_to do |format|
      if @category.save
        @group_category = @category.group_categories.create(group_category_params)
        format.html do
          redirect_to group_path(@group_category.group_id), notice: 'Transaction was successfully created.'
        end
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
    group = Group.find(params[:group_id])
    @category = group.categories.find(params[:id])
    # @gc = @category.group_categories.find(params[id])
    @category.destroy

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
    params.require(:category).permit(:name, :amount)
  end
end
