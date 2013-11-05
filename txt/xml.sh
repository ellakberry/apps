#!/bin/bash
xml=$(cat <<- EOF
<item>
<basepricewithtax>6686</basepricewithtax>
<category_id><![CDATA[]]></category_id>
<category_path><![CDATA[]]></category_path>
<created_by>0</created_by>
<created_on>30/11/-0001 01:34:52</created_on>
<custom></custom>
<customtitle><![CDATA[]]></customtitle>
<custom_param><![CDATA[]]></custom_param>
<custom_price><![CDATA[]]></custom_price>
<custom_shipping></custom_shipping>
<custom_title><![CDATA[]]></custom_title>
<custom_value><![CDATA[]]></custom_value>
<discountamount>000</discountamount>
<discountedpricewithouttax>5526</discountedpricewithouttax>
<file_url><![CDATA[$file_url]]></file_url>
<file_url_thumb><![CDATA[]]></file_url_thumb>
<hits>0</hits>
<intnotes></intnotes>
<layout>0</layout>
<locked_by>0</locked_by>
<locked_on>30/11/-0001 01:34:52</locked_on>
<low_stock_notification>5</low_stock_notification>
<manufacturer_name><![CDATA[Manufacturer]]></manufacturer_name>
<max_order_level></max_order_level>
<metaauthor></metaauthor>
<metadesc><![CDATA[]]></metadesc>
<metakey><![CDATA[]]></metakey>
<metarobot></metarobot>
<min_order_level></min_order_level>
<modified_by>627</modified_by>
<modified_on>28/10/2012 19:55:56</modified_on>
<override>0</override>
<picture_url>/images/stories/virtuemart/product/power_sander.jpg</picture_url>
<pordering>0</pordering>
<pricebeforetax>5525</pricebeforetax>
<pricewithouttax>5526</pricewithouttax>
<product_availability>1-2m.gif</product_availability>
<product_available_date>21/12/2010 02:00:00</product_available_date>
<product_box>0</product_box>
<product_currency>USD</product_currency>
<product_desc><![CDATA[$product_desc]]></product_desc>
<product_height>0.0000</product_height>
<product_in_stock>2</product_in_stock>
<product_length>0.0000</product_length>
<product_lwh_uom>M</product_lwh_uom>
<product_name><![CDATA[Power Sander]]></product_name>
<product_ordered>0</product_ordered>
<product_override_price>000</product_override_price>
<product_packaging>0</product_packaging>
<product_params>min_order_level=""|max_order_level=""|product_box=""|</product_params>
<product_parent_id>0</product_parent_id>
<product_parent_sku></product_parent_sku>
<product_price>7499</product_price>
<product_sales>0</product_sales>
<product_sku>P04</product_sku>
<product_special>0</product_special>
<product_s_desc><![CDATA[Blast away that paint job from the past.  Use this power sander to really show them you mean business.]]></product_s_desc>
<product_unit>KG</product_unit>
<product_url><![CDATA[]]></product_url>
<product_weight>10.0000</product_weight>
<product_weight_uom>KG</product_weight_uom>
<product_width>0.0000</product_width>
<published>0</published>
<related_products></related_products>
<salesprice>6686</salesprice>
<shopper_group_name><![CDATA[]]></shopper_group_name>
<shopper_group_name_price><![CDATA[*]]></shopper_group_name_price>
<slug><![CDATA[power-sander]]></slug>
<taxamount>1160</taxamount>
<virtuemart_product_id>10</virtuemart_product_id>
<virtuemart_vendor_id>1</virtuemart_vendor_id>
</item>

EOF
)
PKG=$1
#echo $xml
echo $xml > $PKG.xml

