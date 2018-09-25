class GsaClassesController < ApplicationController
    def index
        @classes = GsaClass.all
    end
    def show
        @class = GsaClass.find(params[:id])
    end
    def new
        @class = GsaClass.new
    end
    def edit
        @class =GsaClass.find(params[:id])
    end
    def create
        @class = GsaClass.new(class_params)
        if @class.save
            redirect_to @class
        else
            render 'new'
        end
    end
    def update
        @class = GsaClass.find(params[:id])
       
        if @class.update(class_params)
          redirect_to @class
        else
          render 'edit'
        end
    end
    def destroy
        @class = GsaClass.find(params[:id])
        @class.destroy
        
        redirect_to gsa_classes_path
    end
    private
        def class_params
            params.require(:gsa_class).permit(:title, :spaces)
        end
end
