class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @sale.invoices.build
    #@sale.client.build
    @client = @sale.build_client
    @invoice = Invoice.new
    @invoice.products.build
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    byebug
    @client = Client.create(rut: params["sale"]["clients"]["rut"],
                            unidad_compra: params["sale"]["clients"]["unidad_compra"],
                            razon: params["sale"]["clients"]["razon"],
                            direccion: params["sale"]["clients"]["direccion"],
                            comuna: params["sale"]["clients"]["comuna"],
                            region: params["sale"]["clients"]["region"],
                            institucion: params["sale"]["clients"]["institucion"])
    sale_params["client_id"] = @client.id

    @invoice = Invoice.create(fecha_despacho: params["sale"]["invoices_attributes"]["fecha_despacho"],
                           orden_transporte: params["sale"]["invoices_attributes"]["orden_transporte"],
                           empresa: params["sale"]["invoices_attributes"]["empresa"],
                           numero_factura: params["sale"]["invoices_attributes"]["numero_factura"],
                           products_attributes: Product.attribute_names.map(&:to_sym))
    params["sale"]["invoices_attributes"]["sale_id"] = @sale.id
    product_models.each do |ii|
      @invoice.products << ii
    end

    @sale = Sale.new(sale_params)


    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:client_id, :codigo_oc, :numero_licitacion, :fecha_envio, :estado, :moneda, :total, :forma_pago, clients_attributes: Client.attribute_names.map(&:to_sym),invoices_attributes: Invoice.attribute_names.map(&:to_sym))
    end
end
