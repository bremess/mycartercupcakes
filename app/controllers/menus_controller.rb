class MenusController < ApplicationController
#Create
    def new
        @new=Menu.new
       render "new" 
    end
    
    def create
        @new=Menu.new
        @new.name=params["name"]
        @new.photo=params["photo"]
        @new.description=params["description"]
        @new.price=params["price"]
        if @new.save
            redirect_to "/menus", :notice => "Menu item created successfully"
        else
            render "new"
        end
    end

#Read
    def show
        @show=Menu.find_by(:id => params[:id])
       if @show.present?
            render "show"
        else
           redirect_to menus_url, :notice => "The record doesn't exist"
       
       
        end
            
    end
    def index
       @show=Menu.all
        render "index"
    end


#Update
    def edit
        @edit=Menu.find(params[:id])
        render "edit"
    end

    def update
        @edit=Menu.find(params[:id])
        @edit.name = params["name"]
        @edit.photo = params["photo"]
        @edit.description = params["description"]
        @edit.price = params["price"]
        if @edit.save
                redirect_to menu_url(@edit.id)
        else
            render "new"
        end
    end

#Destroy
    def delete
        @delete = Menu.find(params[:id])
        @delete.destroy
        redirect_to "/menus", :notice => "Menu item deleted"
    end


end