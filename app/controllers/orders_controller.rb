class OrdersController < ApplicationController
   
   
    #CREATE 
    def new
        @item=Order.new
    end
    def create 
    @item=Order.new
    @item.fname=params["fname"]
    @item.lname=params["lname"]
    @item.email=params["email"]
    @item.phone=params["phone"]
    @item.ptime=params["ptime"]
    @item.pdate=params["pdate"]
    
    if @item.save
        redirect_to "/orders", :notice => "Order created successful."
    else
        render "new"
    end 
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
    
   #READ
    def show 
        @order=Order.find_by(:id => params[:id])
        @order_item=OrderItem.new
        if @order.present?
            render "show"
        else
            redirect_to orders_url, :notice => "The record doesn't exist"
        end
    end
    
    def index
        @item=Order.all
        render "index"
   end
    
    
    

    
    
    
    #UPDATE
    def edit
        @item=Order.find(params[:id]) #How do I use find_by> | @item=Order.find_by(:id=>params[:id])
    render "edit"
    end
    
    def update
        @item=Order.find(params[:id])
        @item.fname =params["fname"]
        @item.lname =params["lname"]
        @item.email =params["email"]
        @item.phone =params["phone"]
        @item.ptime = params["ptime"]
        @item.pdate = params["pdate"]
        if @item.save
            redirect_to orders_url(@item.id)
        else
            render "new"
        end
    end

    
    
    
    #DELETE
    
 def delete
        @delete = Order.find(params[:id])
        @delete.destroy
        redirect_to "/orders", :notice => "Menu item deleted"
    end


end
    
    
    
    
    
    
    
    