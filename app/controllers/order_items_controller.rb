class OrderItemsController < ApplicationController
    
    #Create
    def new
        @item = OrderItem.new
    end
    
    def create
        @item = OrderItem.new
        @item.menu_id = params["menu_id"]
        @item.order_id = params["order_id"]
        @item.quantity = params["quantity"]
        
        if @item.save
         redirect_to order_url(@item.order_id), :notice => "Order item created successfully."
        else
            render "new"
        end
    end
        
        
        
#Read
    def show 
         @item=OrderItem.find_by(:id => params[:id])
         if @item.present?
             render "show"
         else 
             redirect_to order_items_url, :notice => "The record doesn't exist"
         end 
    end 
    
    def index 
        @item=OrderItem.all
        render "index"
    end 
    
    #Update
    def edit 
        @item=OrderItem.find(params[:id]) 
        render "edit"
    end
    
    def update 
        @item=OderItem(params[:id])
        @item.menu_id=params["menu_id"]
        @item.order_id=params["order_id"]
        @item.quantity=params["quantity"]
        if @item.save
            redirect_to order_item_url(@item.id)
        else
            render "new"
        end 
    end 
    
    
    #Delete
    def delete
        @item = OrderItem.find(params[:id])
        @item.destory
        redirect_to "/order_item", :notice => "Order item deleted."
    end
end
    
    