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
                            <div id="PTMARKETPLACE_OLX_LATITUDE_ALERT"></div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label>{l s='Longitude' mod='ptmarketplace'}:</label>
                            <div id="PTMARKETPLACE_OLX_LONGITUDE_LABEL">{$PTMARKETPLACE_OLX_LONGITUDE}</div>
                            <div id="PTMARKETPLACE_OLX_LONGITUDE_ALERT"></div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label>{l s='Zoom' mod='ptmarketplace'}:</label>
                            <div id="PTMARKETPLACE_OLX_ZOOM_LABEL">{$PTMARKETPLACE_OLX_ZOOM}</div>
                            <div id="PTMARKETPLACE_OLX_ZOOM_ALERT"></div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label>{l s='Name' mod='ptmarketplace'}:</label>
                            <div id="PTMARKETPLACE_OLX_PERSON_LABEL">{$PTMARKETPLACE_OLX_PERSON}</div>
                            <div id="PTMARKETPLACE_OLX_PERSON_ALERT"></div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label>{l s='Telephone' mod='ptmarketplace'}:</label>
                            <div id="PTMARKETPLACE_OLX_PHONE_LABEL">{$PTMARKETPLACE_OLX_PHONE}</div>
                            <div id="PTMARKETPLACE_OLX_PHONE_ALERT"></div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label>{l s='Advertiser Type' mod='ptmarketplace'}:</label>
                            <div id="PTMARKETPLACE_OLX_ADV_TYPE_LABEL">{$PTMARKETPLACE_OLX_ADV_TYPE}</div>
                            <div id="PTMARKETPLACE_OLX_ADV_TYPE_ALERT"></div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label>{l s='Images' mod='ptmarketplace'} ({count($PTMARKETPLACE_OLX_IMAGES)}):</label>
                            {foreach from=$PTMARKETPLACE_OLX_IMAGES item=image key=imagenr}

                                <p style="padding: 1px; border-bottom: 1px solid #cccccc">
                                    <a href="#" type="button" data-toggle="modal" data-target="#myModal{$imagenr+1}">
                                        {$imagenr+1} - {basename($image)}
                                    </a>
                                </p>
                                <!-- Modal -->
                                <div class="modal fade" id="myModal{$imagenr+1}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            </div>
                                            <div class="modal-body">
                                                <img src="{$image}" >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        </div>

                        <div class="form-group col-lg-12">
                            <label for="PTMARKETPLACE_OLX_PRODUCT_TYPE">*{l s='Product category' mod='ptmarketplace'}
                                :</label>
                            <select class="required-input" id="PTMARKETPLACE_OLX_PRODUCT_TYPE"
                                    name="PTMARKETPLACE_OLX_PRODUCT_TYPE">
                                <option value="">{l s='Select one' mod='ptmarketplace'}</option>
                                {foreach from=$PTMARKETPLACE_OLX_PRODUCTS item=product}
                                    <option value="{$product['id']}">{$product['type']} / {$product['name']}</option>
                                {/foreach}
                            </select>
                            <div style="float: right" id="PTMARKETPLACE_OLX_PRODUCT_TYPE_ALERT"></div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label for="PTMARKETPLACE_OLX_TITLE">*{l s='Title' mod='ptmarketplace'}:</label>
                            <input class="required-input" type="text" id="PTMARKETPLACE_OLX_TITLE"
                                   name="PTMARKETPLACE_OLX_TITLE"
                                   value="{$PTMARKETPLACE_OLX_TITLE}"/>
                            <div style="float: right" id="PTMARKETPLACE_OLX_TITLE_ALERT"></div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label for="PTMARKETPLACE_OLX_PRICE">*{l s='Price' mod='ptmarketplace'}:</label>
                            <input class="required-input" type="text" id="PTMARKETPLACE_OLX_PRICE"
                                   name="PTMARKETPLACE_OLX_PRICE"
                                   value="{$PTMARKETPLACE_OLX_PRICE}"/>
                            <div style="float: right" id="PTMARKETPLACE_OLX_PRICE_ALERT"></div>
                        </div>

                        <div class="form-group col-lg-12">
                            <label for="PTMARKETPLACE_OLX_DESCRIPTION">{l s='Description' mod='ptmarketplace'}
                                :</label>
                            <textarea class="form-control" rows="8" id="PTMARKETPLACE_OLX_DESCRIPTION"
                                      name="PTMARKETPLACE_OLX_DESCRIPTION">{$PTMARKETPLACE_OLX_DESCRIPTION|strip_tags:true}</textarea>
                            <div style="float: right" id="PTMARKETPLACE_OLX_DESCRIPTION_ALERT"></div>
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
                        {foreach from=$PTMARKETPLACE_OLX_IMAGES item=image}
                            <input type="hidden" name=PTMARKETPLACE_OLX_IMAGES[] value="{$image}">
                        {/foreach}
                        <div class="form-group col-lg-12 ">
                            <div class="submit">
                                <button onclick="checksubmit()" type="submit" id="submitolxbuildxml"
                                        name="submitolxbuildxml"
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

            // Check inputs on load
            var fields = ["PTMARKETPLACE_OLX_LATITUDE",
                "PTMARKETPLACE_OLX_LONGITUDE", "PTMARKETPLACE_OLX_ZOOM", "PTMARKETPLACE_OLX_PERSON",
                "PTMARKETPLACE_OLX_PHONE", "PTMARKETPLACE_OLX_ADV_TYPE", "PTMARKETPLACE_OLX_PRODUCT_TYPE",
                "PTMARKETPLACE_OLX_TITLE", "PTMARKETPLACE_OLX_PRICE"];
            var alerts = ["PTMARKETPLACE_OLX_LATITUDE_ALERT", "PTMARKETPLACE_OLX_LONGITUDE_ALERT", "PTMARKETPLACE_OLX_ZOOM_ALERT",
                "PTMARKETPLACE_OLX_PERSON_ALERT", "PTMARKETPLACE_OLX_PHONE_ALERT", "PTMARKETPLACE_OLX_ADV_TYPE_ALERT",
                "PTMARKETPLACE_OLX_PRODUCT_TYPE_ALERT", "PTMARKETPLACE_OLX_TITLE_ALERT", "PTMARKETPLACE_OLX_PRICE_ALERT"];

            var i, l = fields.length;
            var field, value, alert;
            for (i = 0; i < l; i++) {

                field = document.getElementById(fields[i]);
                value = $("#" + fields[i]).val().length;
                alert = document.getElementById(alerts[i]);
                if (value === 0) {

                    $("#" + alerts[i]).text("{l s='Field is empty' mod='ptmarketplace'}");

                    if (field.className === "required-input") {

                        alert.className = "label label-danger";

                    } else {

                        alert.className = "label label-warning";

                    }
                }
            }

            // Description field validation on load
            var PTMARKETPLACE_OLX_DESCRIPTION_ALERT = document.getElementById("PTMARKETPLACE_OLX_DESCRIPTION_ALERT");
            var description_value = $("#PTMARKETPLACE_OLX_DESCRIPTION").val().length;
            var init_count = 4096 - description_value;

            if (init_count < 0) {

                $("#PTMARKETPLACE_OLX_DESCRIPTION_ALERT").text(Math.abs(init_count) + " {l s='characters exceeded' mod='ptmarketplace'}");
                PTMARKETPLACE_OLX_DESCRIPTION_ALERT.className = "label label-danger";

            } else {

                $("#PTMARKETPLACE_OLX_DESCRIPTION_ALERT").text(init_count + " {l s='characters left' mod='ptmarketplace'}");
                PTMARKETPLACE_OLX_DESCRIPTION_ALERT.className = "label label-success";
            }

            loadCities('{$PTMARKETPLACE_OLX_REGION}', '{$PTMARKETPLACE_OLX_CITY}');

        });

        // input check on change
        var PTMARKETPLACE_OLX_PRODUCT_TYPE_ALERT = document.getElementById("PTMARKETPLACE_OLX_PRODUCT_TYPE_ALERT");
        $(document).on("change", "#PTMARKETPLACE_OLX_PRODUCT_TYPE", function () {

            var selected = $(this).val().length;

            if (selected === 0) {

                $("#PTMARKETPLACE_OLX_PRODUCT_TYPE_ALERT").text("{l s='Field is empty' mod='ptmarketplace'}");
                PTMARKETPLACE_OLX_PRODUCT_TYPE_ALERT.className = "label label-danger";

            } else {

                $("#PTMARKETPLACE_OLX_PRODUCT_TYPE_ALERT").text("");
                PTMARKETPLACE_OLX_PRODUCT_TYPE_ALERT.className = "";
            }
        });

        // Title check on input
        var PTMARKETPLACE_OLX_TITLE_ALERT = document.getElementById("PTMARKETPLACE_OLX_TITLE_ALERT");
        $(document).on("input", "#PTMARKETPLACE_OLX_TITLE", function () {

            var keyinput = $(this).val().length;

            if (keyinput === 0) {

                $("#PTMARKETPLACE_OLX_TITLE_ALERT").text("{l s='Field is empty' mod='ptmarketplace'}");
                PTMARKETPLACE_OLX_TITLE_ALERT.className = "label label-danger";

            } else {

                $("#PTMARKETPLACE_OLX_TITLE_ALERT").text("");
                PTMARKETPLACE_OLX_TITLE_ALERT.className = "";
            }

        });

        // Price check on input
        var PTMARKETPLACE_OLX_PRICE_ALERT = document.getElementById("PTMARKETPLACE_OLX_PRICE_ALERT");
        $(document).on("input", "#PTMARKETPLACE_OLX_PRICE", function () {

            var keyinput = $(this).val().length;

            if (keyinput === 0) {

                $("#PTMARKETPLACE_OLX_PRICE_ALERT").text("{l s='Field is empty' mod='ptmarketplace'}");
                PTMARKETPLACE_OLX_PRICE_ALERT.className = "label label-danger";

            } else {

                $("#PTMARKETPLACE_OLX_PRICE_ALERT").text("");
                PTMARKETPLACE_OLX_PRICE_ALERT.className = "";
            }

        });

        // Description check on input
        var PTMARKETPLACE_OLX_DESCRIPTION_ALERT = document.getElementById("PTMARKETPLACE_OLX_DESCRIPTION_ALERT");
        $(document).on("input", "#PTMARKETPLACE_OLX_DESCRIPTION", function () {

            var limit = 4096;
            var keyinput = $(this).val().length;
            var keyleft = limit - keyinput;

            if (keyleft < 0) {

                $("#PTMARKETPLACE_OLX_DESCRIPTION_ALERT").text(Math.abs(keyleft) + " {l s='characters exceeded' mod='ptmarketplace'}");
                PTMARKETPLACE_OLX_DESCRIPTION_ALERT.className = "label label-danger";

            } else {

                $("#PTMARKETPLACE_OLX_DESCRIPTION_ALERT").text(keyleft + " {l s='characters left' mod='ptmarketplace'}");
                PTMARKETPLACE_OLX_DESCRIPTION_ALERT.className = "label label-success";
            }

        });

        function checksubmit() {

            var PTMARKETPLACE_OLX_PRODUCT_TYPE_VALIDATION = $("#PTMARKETPLACE_OLX_PRODUCT_TYPE").val().length;
            var PTMARKETPLACE_OLX_TITLE_VALIDATION = $("#PTMARKETPLACE_OLX_TITLE").val().length;
            var PTMARKETPLACE_OLX_PRICE_VALIDATION = $("#PTMARKETPLACE_OLX_PRICE").val().length;
            var PTMARKETPLACE_OLX_DESCRIPTION_VALIDATION = $("#PTMARKETPLACE_OLX_DESCRIPTION").val().length;

            if (PTMARKETPLACE_OLX_PRODUCT_TYPE_VALIDATION === 0 ||
                PTMARKETPLACE_OLX_TITLE_VALIDATION === 0 ||
                PTMARKETPLACE_OLX_PRICE_VALIDATION === 0 ||
                PTMARKETPLACE_OLX_DESCRIPTION_VALIDATION > 4096
            ) {

                event.preventDefault();
            }
        }

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
