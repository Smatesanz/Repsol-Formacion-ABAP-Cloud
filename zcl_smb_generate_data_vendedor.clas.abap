CLASS zcl_smb_generate_data_vendedor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_smb_generate_data_vendedor IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DELETE FROM zsmb_vendedor.

    INSERT zsmb_vendedor FROM TABLE @( VALUE #(
      ( mandt = sy-mandt idvendedor = 'SE116245'
        nombre = 'Sergio Matesanz' email = 'sergio.matesanz@servexternos.repsol.com' activo = abap_true )
      ( mandt = sy-mandt idvendedor = 'R901848'
        nombre = 'Vendedor Dos' email = 'vendedor2@empresa.com' activo = abap_true )
      ( mandt = sy-mandt idvendedor = 'VENDEDOR3'
        nombre = 'Vendedor Tres' email = 'vendedor3@empresa.com' activo = abap_false )
    ) ).

    out->write( 'Vendedores cargados correctamente.' ).
  ENDMETHOD.
ENDCLASS.
