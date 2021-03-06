# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190624225343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articulos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "foto"
    t.string   "barcode"
    t.integer  "unidad_medida_id"
    t.integer  "componente_id"
    t.integer  "modelo_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "medida_id"
    t.decimal  "ptax"
    t.decimal  "ptax1"
    t.decimal  "ptax2"
  end

  add_index "articulos", ["componente_id"], name: "index_articulos_on_componente_id", using: :btree
  add_index "articulos", ["medida_id"], name: "index_articulos_on_medida_id", using: :btree
  add_index "articulos", ["modelo_id"], name: "index_articulos_on_modelo_id", using: :btree
  add_index "articulos", ["unidad_medida_id"], name: "index_articulos_on_unidad_medida_id", using: :btree
  add_index "articulos", ["user_id"], name: "index_articulos_on_user_id", using: :btree

  create_table "canals", force: :cascade do |t|
    t.string   "name"
    t.integer  "tipocanal_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "canals", ["tipocanal_id"], name: "index_canals_on_tipocanal_id", using: :btree
  add_index "canals", ["user_id"], name: "index_canals_on_user_id", using: :btree

  create_table "ciudads", force: :cascade do |t|
    t.string   "name"
    t.decimal  "latitude",        precision: 9, scale: 6
    t.decimal  "longitude",       precision: 9, scale: 6
    t.integer  "departamento_id"
    t.integer  "user_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "region_id"
  end

  add_index "ciudads", ["departamento_id"], name: "index_ciudads_on_departamento_id", using: :btree
  add_index "ciudads", ["region_id"], name: "index_ciudads_on_region_id", using: :btree
  add_index "ciudads", ["user_id"], name: "index_ciudads_on_user_id", using: :btree

  create_table "componentes", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "componentes", ["user_id"], name: "index_componentes_on_user_id", using: :btree

  create_table "compras", force: :cascade do |t|
    t.text     "num_factura"
    t.date     "fecha_ingreso"
    t.decimal  "cantidad",      precision: 16, scale: 2
    t.decimal  "valor_unidad",  precision: 16, scale: 2
    t.string   "moneda"
    t.decimal  "valor_total",   precision: 16, scale: 2
    t.decimal  "valor_venta",   precision: 16, scale: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "user_id"
    t.integer  "articulo_id"
    t.integer  "tienda_id"
  end

  add_index "compras", ["articulo_id"], name: "index_compras_on_articulo_id", using: :btree
  add_index "compras", ["tienda_id"], name: "index_compras_on_tienda_id", using: :btree
  add_index "compras", ["user_id"], name: "index_compras_on_user_id", using: :btree

  create_table "conteos", force: :cascade do |t|
    t.decimal  "cantidad",        precision: 16, scale: 2
    t.string   "codbarras"
    t.integer  "inventario_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "articulo_id"
    t.date     "fecha_conteo"
    t.decimal  "cantidad_salida", precision: 16, scale: 2
    t.integer  "procesado"
    t.integer  "user_id"
  end

  add_index "conteos", ["articulo_id"], name: "index_conteos_on_articulo_id", using: :btree
  add_index "conteos", ["inventario_id"], name: "index_conteos_on_inventario_id", using: :btree

  create_table "departamentos", force: :cascade do |t|
    t.string   "name"
    t.date     "huso"
    t.integer  "pais_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "departamentos", ["pais_id"], name: "index_departamentos_on_pais_id", using: :btree
  add_index "departamentos", ["user_id"], name: "index_departamentos_on_user_id", using: :btree

  create_table "einvoices", force: :cascade do |t|
    t.string   "organizationtype"
    t.string   "name"
    t.string   "identification"
    t.string   "autorization"
    t.date     "init_date_allow"
    t.date     "end_date_allow"
    t.string   "invoice_code"
    t.string   "prefix"
    t.integer  "from"
    t.integer  "to"
    t.string   "currency"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "data"
    t.integer  "Vat_applicable"
    t.integer  "vat_applicable2"
    t.date     "vat_applicable1"
    t.decimal  "ptax1"
    t.decimal  "ptax2"
  end

  add_index "einvoices", ["user_id"], name: "index_einvoices_on_user_id", using: :btree

  create_table "empresas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "webpage"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "empresas", ["user_id"], name: "index_empresas_on_user_id", using: :btree

  create_table "equipos", force: :cascade do |t|
    t.string   "referencia"
    t.integer  "descontinuado"
    t.integer  "fabricante_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "equipos", ["fabricante_id"], name: "index_equipos_on_fabricante_id", using: :btree
  add_index "equipos", ["user_id"], name: "index_equipos_on_user_id", using: :btree

  create_table "fabricantes", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fabricantes", ["user_id"], name: "index_fabricantes_on_user_id", using: :btree

  create_table "inkardexes", force: :cascade do |t|
    t.date     "infecha"
    t.string   "numdocumento"
    t.decimal  "cantidad",     precision: 16, scale: 2
    t.decimal  "existencia",   precision: 16, scale: 2
    t.decimal  "valorcompra",  precision: 16, scale: 2
    t.string   "moneda"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id"
    t.integer  "articulo_id"
  end

  add_index "inkardexes", ["articulo_id"], name: "index_inkardexes_on_articulo_id", using: :btree
  add_index "inkardexes", ["user_id"], name: "index_inkardexes_on_user_id", using: :btree

  create_table "inventarios", force: :cascade do |t|
    t.string   "moneda"
    t.decimal  "cantidad_integer", precision: 16, scale: 2
    t.decimal  "valor_unidad",     precision: 16, scale: 2
    t.decimal  "valor_total",      precision: 16, scale: 2
    t.integer  "tienda_id"
    t.integer  "articulo_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "user_id"
    t.string   "num_factura"
    t.decimal  "valor_venta",      precision: 16, scale: 2
  end

  add_index "inventarios", ["articulo_id"], name: "index_inventarios_on_articulo_id", using: :btree
  add_index "inventarios", ["tienda_id"], name: "index_inventarios_on_tienda_id", using: :btree
  add_index "inventarios", ["user_id"], name: "index_inventarios_on_user_id", using: :btree

  create_table "kardexes", force: :cascade do |t|
    t.integer  "valor_compra"
    t.integer  "valor_venta"
    t.date     "fecha_ingreso"
    t.integer  "inventario_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "articulo_id"
    t.date     "fecha_conteo"
    t.date     "fecha_salida"
    t.float    "cantidad_salida"
    t.integer  "procesado"
    t.integer  "user_id"
  end

  add_index "kardexes", ["articulo_id"], name: "index_kardexes_on_articulo_id", using: :btree
  add_index "kardexes", ["inventario_id"], name: "index_kardexes_on_inventario_id", using: :btree

  create_table "medidas", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "medidas", ["user_id"], name: "index_medidas_on_user_id", using: :btree

  create_table "modelos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "modelos", ["user_id"], name: "index_modelos_on_user_id", using: :btree

  create_table "outkardexes", force: :cascade do |t|
    t.date     "outfecha"
    t.string   "numdocumento"
    t.float    "cantidad"
    t.float    "valorventa"
    t.string   "moneda"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "articulo_id"
  end

  add_index "outkardexes", ["articulo_id"], name: "index_outkardexes_on_articulo_id", using: :btree
  add_index "outkardexes", ["user_id"], name: "index_outkardexes_on_user_id", using: :btree

  create_table "pais", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "huso"
  end

  add_index "pais", ["user_id"], name: "index_pais_on_user_id", using: :btree

  create_table "personas", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "usuarioasignado"
    t.integer  "ciudad_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "personas", ["ciudad_id"], name: "index_personas_on_ciudad_id", using: :btree
  add_index "personas", ["user_id"], name: "index_personas_on_user_id", using: :btree

  create_table "planvisita", force: :cascade do |t|
    t.integer  "usuarioasignado"
    t.date     "fechavisita"
    t.integer  "puntoventum_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "planvisita", ["puntoventum_id"], name: "index_planvisita_on_puntoventum_id", using: :btree
  add_index "planvisita", ["user_id"], name: "index_planvisita_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.integer  "princing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "puntoventa", force: :cascade do |t|
    t.string   "name"
    t.integer  "mtsmaxdistancia"
    t.decimal  "latitude",        precision: 9, scale: 6
    t.decimal  "longitude",       precision: 9, scale: 6
    t.string   "direccion"
    t.string   "telefonos"
    t.string   "email"
    t.integer  "tipocanal_id"
    t.integer  "ciudad_id"
    t.integer  "user_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "puntoventa", ["ciudad_id"], name: "index_puntoventa_on_ciudad_id", using: :btree
  add_index "puntoventa", ["tipocanal_id"], name: "index_puntoventa_on_tipocanal_id", using: :btree
  add_index "puntoventa", ["user_id"], name: "index_puntoventa_on_user_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "regions", ["user_id"], name: "index_regions_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sale_details", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saledetails", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "line"
    t.decimal  "value"
    t.float    "quantity"
    t.float    "total"
    t.integer  "discount_percent"
    t.string   "discountpercent"
    t.integer  "saleheader_id"
    t.integer  "user_id"
    t.integer  "articulo_id"
  end

  create_table "saleheaders", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "num"
    t.string   "citizenship"
    t.text     "allname"
    t.string   "email"
    t.date     "expeditionDate"
    t.decimal  "grossvalue"
    t.decimal  "tax"
    t.decimal  "netvalue"
    t.string   "state"
    t.integer  "user_id"
    t.decimal  "num_id"
    t.integer  "invoice_num"
    t.string   "typeID"
  end

  create_table "tiendas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "empresa_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "tiendas", ["empresa_id"], name: "index_tiendas_on_empresa_id", using: :btree
  add_index "tiendas", ["user_id"], name: "index_tiendas_on_user_id", using: :btree

  create_table "tipocanals", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tipocanals", ["user_id"], name: "index_tipocanals_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "ciudad_id"
    t.string   "numdoc"
    t.integer  "einvoice"
  end

  add_index "users", ["ciudad_id"], name: "index_users_on_ciudad_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "venta", force: :cascade do |t|
    t.date     "fecha"
    t.integer  "qexistencia"
    t.integer  "qventa"
    t.integer  "puntoventum_id"
    t.integer  "equipo_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "venta", ["equipo_id"], name: "index_venta_on_equipo_id", using: :btree
  add_index "venta", ["puntoventum_id"], name: "index_venta_on_puntoventum_id", using: :btree
  add_index "venta", ["user_id"], name: "index_venta_on_user_id", using: :btree

  create_table "visita", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "puntoventum_id"
    t.integer  "planvisitum_id"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "latitude2"
    t.float    "longitude2"
    t.datetime "horaingreso"
    t.datetime "horasalida"
    t.string   "IPin"
    t.string   "IPout"
  end

  add_index "visita", ["planvisitum_id"], name: "index_visita_on_planvisitum_id", using: :btree
  add_index "visita", ["puntoventum_id"], name: "index_visita_on_puntoventum_id", using: :btree
  add_index "visita", ["user_id"], name: "index_visita_on_user_id", using: :btree

end
