{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    Majoinfa, lda <info@majoinfa.com>
*  @copyright 2016 Majoinfa, lda
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="panel">
    <div class="row">
        <div class="col-xs-7 text-left">
            <h2>{l s='PT MARKETPLACE' mod='ptmarketplace'}</h2>
        </div>
    </div>
    <hr/>
    <div class="moduleconfig-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-4">
                    <fieldset>
                        <legend>{l s='Create XML' mod='ptmarketplace'}:</legend>

                        <div class="form-group col-lg-12">
                            <label>{l s='Region/City' mod='ptmarketplace'}:</label>
                            <div id="PTMARKETPLACE_OLX_CITY_LABEL"></div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label>{l s='Latitude' mod='ptmarketplace'}:</label>
                            <div id="PTMARKETPLACE_OLX_LATITUDE_LABEL">{$PTMARKETPLACE_OLX_LATITUDE}</div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label>{l s='Longitude' mod='ptmarketplace'}:</label>
                            <div id="PTMARKETPLACE_OLX_LONGITUDE_LABEL">{$PTMARKETPLACE_OLX_LONGITUDE}</div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label>{l s='Zoom' mod='ptmarketplace'}:</label>
                            <div id="PTMARKETPLACE_OLX_ZOOM_LABEL">{$PTMARKETPLACE_OLX_ZOOM}</div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label>{l s='Name' mod='ptmarketplace'}:</label>
                            <div id="PTMARKETPLACE_OLX_PERSON_LABEL">{$PTMARKETPLACE_OLX_PERSON}</div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label>{l s='Telephone' mod='ptmarketplace'}:</label>
                            <div id="PTMARKETPLACE_OLX_PHONE_LABEL">{$PTMARKETPLACE_OLX_PHONE}</div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label>{l s='Advertiser Type' mod='ptmarketplace'}:</label>
                            <div id="PTMARKETPLACE_OLX_ADV_TYPE">{$PTMARKETPLACE_OLX_ADV_TYPE}</div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label for="PTMARKETPLACE_OLX_PRODUCT_TYPE">*{l s='Product category' mod='ptmarketplace'}
                                :</label>
                            <select id="PTMARKETPLACE_OLX_PRODUCT_TYPE" name="PTMARKETPLACE_OLX_PRODUCT_TYPE">
                                <option value="">{l s='Select one' mod='ptmarketplace'}</option>
                                {foreach from=$PTMARKETPLACE_OLX_PRODUCTS item=product}
                                    <option value="{$product['id']}">{$product['type']} / {$product['name']}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="form-group col-lg-12">
                            <label for="PTMARKETPLACE_OLX_TITLE">*{l s='Title' mod='ptmarketplace'}:</label>
                            <input type="text" id="PTMARKETPLACE_OLX_TITLE" name="PTMARKETPLACE_OLX_TITLE"
                                   value="{$PTMARKETPLACE_OLX_TITLE}"/>
                        </div>

                        <div class="form-group col-lg-12">
                            <label for="PTMARKETPLACE_OLX_PRICE">*{l s='Price' mod='ptmarketplace'}:</label>
                            <input type="text" id="PTMARKETPLACE_OLX_PRICE" name="PTMARKETPLACE_OLX_PRICE"
                                   value="{$PTMARKETPLACE_OLX_PRICE}"/>
                        </div>

                        <div class="form-group col-lg-12">
                            <label for="PTMARKETPLACE_OLX_DESCRIPTION">{l s='Description' mod='ptmarketplace'}
                                :</label>
                            <textarea class="form-control" rows="8" id="PTMARKETPLACE_OLX_DESCRIPTION"
                                      name="PTMARKETPLACE_OLX_DESCRIPTION">{$PTMARKETPLACE_OLX_DESCRIPTION|strip_tags:true}</textarea>
                        </div>

                        <input type="hidden" id="PTMARKETPLACE_OLX_EXTERNAL_ID" name="PTMARKETPLACE_OLX_EXTERNAL_ID"
                               value="{$PTMARKETPLACE_OLX_EXTERNAL_ID}"/>
                        <input type="hidden" id="PTMARKETPLACE_OLX_CITY" name="PTMARKETPLACE_OLX_CITY"
                               value="{$PTMARKETPLACE_OLX_CITY}"/>
                        <input type="hidden" id="PTMARKETPLACE_OLX_REGION" name="PTMARKETPLACE_OLX_REGION"
                               value="{$PTMARKETPLACE_OLX_REGION}"/>
                        <input type="hidden" id="PTMARKETPLACE_OLX_LATITUDE" name="PTMARKETPLACE_OLX_LATITUDE"
                               value="{$PTMARKETPLACE_OLX_LATITUDE}"/>
                        <input type="hidden" id="PTMARKETPLACE_OLX_LONGITUDE" name="PTMARKETPLACE_OLX_LONGITUDE"
                               value="{$PTMARKETPLACE_OLX_LONGITUDE}"/>
                        <input type="hidden" id="PTMARKETPLACE_OLX_ZOOM" name="PTMARKETPLACE_OLX_ZOOM"
                               value="{$PTMARKETPLACE_OLX_ZOOM}"/>
                        <input type="hidden" id="PTMARKETPLACE_OLX_PERSON" name="PTMARKETPLACE_OLX_PERSON"
                               value="{$PTMARKETPLACE_OLX_PERSON}"/>
                        <input type="hidden" id="PTMARKETPLACE_OLX_PHONE" name="PTMARKETPLACE_OLX_PHONE"
                               value="{$PTMARKETPLACE_OLX_PHONE}"/>
                        <input type="hidden" id="PTMARKETPLACE_OLX_ADV_TYPE" name="PTMARKETPLACE_OLX_ADV_TYPE"
                               value="{$PTMARKETPLACE_OLX_ADV_TYPE}"/>

                        <div class="form-group col-lg-12 ">
                            <div class="submit">
                                <button type="submit" id="submitolxbuildxml" name="submitolxbuildxml"
                                        class="btn btn-default pull-right">
                                    <span> {l s='Get' mod='ptmarketplace'}</span> <i class="icon-code"></i>
                                </button>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <script type="application/javascript">

        $(document).ready(function () {

            loadCities('{$PTMARKETPLACE_OLX_REGION}', '{$PTMARKETPLACE_OLX_CITY}');

        });

        function loadCities(regionId, cityId) {
            $.ajax({
                type: 'POST',
                headers: { "cache-control": "no-cache" },
                url: '{$module_dir}classes/ajaxrequests/ConfigCity.php',
                async: true,
                cache: false,
                dataType: "json",
                data: 'region_id=' + regionId,
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {

                        if (data[i].id == cityId) {

                            document.getElementById("PTMARKETPLACE_OLX_CITY_LABEL").innerHTML = data[i].text;
                        }
                    }
                },
                error: function () {
                    alert("{l s='Error reading city data' mod='ptmarketplace'}");
                }
            });
        }
    </script>
</div>
