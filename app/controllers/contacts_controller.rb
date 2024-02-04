class ContactsController < ApplicationController
  include Pagy::Backend
  before_action :set_contact, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /contacts or /contacts.json
def index
  if params[:family_member_id]
    @family_member = FamilyMember.find(params[:family_member_id])
    @q = @family_member.contacts.includes(:family_members).ransack(params[:q])
    @pagy, @contacts = pagy(@q.result(distinct: true))
    set_show_family_contacts_button
  else
    @q = current_user.contacts.includes(:family_members)
                                    .select(:id, :name, :phone, :email, :description, :category)
                                    .distinct
                                    .ransack(params[:q])
    @pagy, @contacts = pagy(@q.result(distinct: true))
  end
end

  # GET /contacts/1 or /contacts/1.json
  def show
  end

  # GET /contacts/new

  def new
    @contact = Contact.new

    # Remove empty strings from family_member_ids
    @contact.family_member_ids.reject!(&:empty?) if @contact.family_member_ids

    # Load all family members for the collection_select
    @all_family_members = FamilyMember.all
  end
  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json

def create
  @contact = Contact.new(contact_params)

  # Set family_member_ids based on the selected family members
  @contact.family_member_ids = params[:contact][:family_member_ids].reject(&:empty?) if params[:contact][:family_member_ids].present?

  respond_to do |format|
    if @contact.save
      format.html { redirect_to contacts_url, notice: "Contact was successfully created." }
      format.json { render :index, status: :created, location: @contact }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @contact.errors, status: :unprocessable_entity }
    end
  end
end
  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html do
          redirect_to contacts_url,
                      notice: "Contact was successfully updated."
        end
        format.json { render :index, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @contact.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy!

    respond_to do |format|
      format.html do
        redirect_to contacts_url, notice: "Contact was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
 def contact_params
  params.require(:contact).permit(:name, :phone, :email, :description, :category, family_member_ids: [])
end
def set_show_family_contacts_button
  family_member_with_family_relation = current_user.family_members.find_by(relationship: 'Family')

  if family_member_with_family_relation && family_member_with_family_relation.contacts.exists?
    @show_family_contacts_button = true
    @family_member_id_with_family_relation = family_member_with_family_relation.id
  else
    @show_family_contacts_button = false
  end
end
# def set_show_family_contacts_button
#   family_member_with_family_relation = current_user.family_members.find_by(relationship: 'Family')

#   if family_member_with_family_relation && family_member_with_family_relation.contacts.exists?
#     @show_family_contacts_button = true
#     @family_member_id_with_family_relation = family_member_with_family_relation.id
#   else
#     @show_family_contacts_button = false
#   end
# end
end
