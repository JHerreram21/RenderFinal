class SolicitudesController < ApplicationController
  def new
    @solicitud = Solicitud.new
  end

  def index
    @solicitudes = Solicitud.all
  end

  def buscar 
    @solicitudes = Solicitud.where(email: current_user.email)
  end

  def create
    @solicitud = Solicitud.new(solicitud_params)
    @product = Product.find(@solicitud.product_id)
    @solicitud.nombre_producto = @product.name
    @solicitud.estado = "pendiente"
    if @solicitud.save
      flash[:notice] = 'La solicitud fue creada exitosamente'
      redirect_to products_path
    else
      flash[:alert] = 'Hubo un error al crear la solicitud'
      redirect_to products_path
    end
  end

  def update
    @solicitud = Solicitud.find(params[:id])
    if @solicitud.update(solicitud_params)
      redirect_to solicitudes_path, notice: 'Solicitud actualizada correctamente.'
    else
      render :edit
    end
  end

  def destroy
    @solicitud = Solicitud.find(params[:id])
    @solicitud.destroy
    if current_user.admin?
      redirect_to solicitudes_pendientes_path, notice: 'La solicitud fue eliminada correctamente.'
    else
      redirect_to solicitudes_buscar_path
    end
  end
  
  def aceptar
    @solicitud = Solicitud.find(params[:id])
    @solicitud.update(estado: "aceptada")
    redirect_to solicitudes_path
  end

  def rechazar
    @solicitud = Solicitud.find(params[:id])
    @solicitud.update(estado: "rechazada")
    redirect_to solicitudes_path
  end

  def pendientes
    @solicitudes_pendientes = Solicitud.where(estado: "pendiente")
  end

  def aceptadas_rechazadas
    @solicitudes_aceptadas = Solicitud.where(estado: "aceptada")
    @solicitudes_rechazadas = Solicitud.where(estado: "rechazada")
  end
  
  private
  def solicitud_params
    params.require(:solicitud).permit(:nombre, :email, :product_id, :nombre_producto)
  end
end

