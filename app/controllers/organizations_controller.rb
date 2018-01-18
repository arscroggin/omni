class OrganizationsController < ApplicationController

    def show
        @organization = Organization.find(params[:id])
    end

    def edit
        @organization = Organization.find(params[:id])
    end

    def update
        @organization = Organization.find(params[:id])
       
        if @organization.update(org_params)
          redirect_to @organization
        else
          render 'edit'
        end
      end
       
      private
        def org_params
          params.require(:organization).permit(:name, :domain)
        end

end
