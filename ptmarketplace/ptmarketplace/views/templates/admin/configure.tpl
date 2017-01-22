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
    <div class="row moduleconfig-header">
        <div class="col-xs-5 text-right">
            <img src="{$module_dir|escape:'html':'UTF-8'}views/img/logo.jpg"/>
        </div>
        <div class="col-xs-7 text-left">
            <h2>{l s='Lorem' mod='ptmarketplace'}</h2>
            <h4>{l s='Lorem ipsum dolor' mod='ptmarketplace'}</h4>
        </div>
    </div>
    <hr/>
    <div class="moduleconfig-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-4">

                    <form action="" method="post" id="olxStartupContent">
                        <fieldset>
                            <legend>{l s='Configurations' mod='ptmarketplace'}:</legend>

                            <div class="form-group col-lg-12">
                                <label for="PTMARKETPLACE_OLX_REGION">{l s='Region' mod='ptmarketplace'}:</label>
                                <select id="PTMARKETPLACE_OLX_REGION" name="PTMARKETPLACE_OLX_REGION">
                                    {foreach from=$PTMARKETPLACE_OLX_REGIONS item=region}
                                        <option value="{$region['id']}"
                                                {if $region['id'] == $PTMARKETPLACE_OLX_REGION}selected="selected"{/if}>{$region['name']}</option>
                                    {/foreach}
                                </select>
                            </div>

                            <div class="form-group col-lg-12">
                                <label for="PTMARKETPLACE_OLX_CITY">{l s='City' mod='ptmarketplace'}:</label>
                                <select id="PTMARKETPLACE_OLX_CITY" name="PTMARKETPLACE_OLX_CITY">
                                </select>
                            </div>

                            <div class="form-group col-lg-12">
                                <label for="PTMARKETPLACE_OLX_LATITUDE">{l s='Latitude' mod='ptmarketplace'}
                                    :</label>
                                <input type="text" placeholder="latitude" id="PTMARKETPLACE_OLX_LATITUDE"
                                       name="PTMARKETPLACE_OLX_LATITUDE" value="{$PTMARKETPLACE_OLX_LATITUDE}"/>
                            </div>

                            <div class="form-group col-lg-12">
                                <label for="PTMARKETPLACE_OLX_LONGITUDE">{l s='Longitude' mod='ptmarketplace'}
                                    :</label>
                                <input type="text" placeholder="longitude" id="PTMARKETPLACE_OLX_LONGITUDE"
                                       name="PTMARKETPLACE_OLX_LONGITUDE"
                                       value="{$PTMARKETPLACE_OLX_LONGITUDE}"/>
                            </div>

                            <div class="form-group col-lg-12">
                                <label for="PTMARKETPLACE_OLX_ZOOM">{l s='Zoom' mod='ptmarketplace'}:</label>
                                <input type="text" placeholder="zoom" id="PTMARKETPLACE_OLX_ZOOM"
                                       name="PTMARKETPLACE_OLX_ZOOM" value="{$PTMARKETPLACE_OLX_ZOOM}"/>
                            </div>

                            <div class="form-group col-lg-12">
                                <label for="PTMARKETPLACE_OLX_PERSON">{l s='Name' mod='ptmarketplace'}:</label>
                                <input type="text" placeholder="{l s='Name' mod='ptmarketplace'}"
                                       id="PTMARKETPLACE_OLX_PERSON" name="PTMARKETPLACE_OLX_PERSON"
                                       value="{$PTMARKETPLACE_OLX_PERSON}"/>
                            </div>

                            <div class="form-group col-lg-12">
                                <label for="PTMARKETPLACE_OLX_PHONE">{l s='Telephone' mod='ptmarketplace'}:</label>
                                <input type="text" placeholder="{l s='Telephone' mod='ptmarketplace'}"
                                       id="PTMARKETPLACE_OLX_PHONE" name="PTMARKETPLACE_OLX_PHONE"
                                       value="{$PTMARKETPLACE_OLX_PHONE}"/>
                            </div>

                            <div class="form-group col-lg-12">
                                <label for="PTMARKETPLACE_OLX_ADV_TYPE">{l s='Advertiser Type' mod='ptmarketplace'}
                                    :</label>
                                <select id="PTMARKETPLACE_OLX_ADV_TYPE" name="PTMARKETPLACE_OLX_ADV_TYPE">
                                    <option value="">{l s='Select one' mod='ptmarketplace'}</option>
                                    <option {if $PTMARKETPLACE_OLX_ADV_TYPE == 'business'}selected="selected"{/if}
                                            value="business">{l s='Business' mod='ptmarketplace'}</option>
                                    <option {if $PTMARKETPLACE_OLX_ADV_TYPE == 'private'}selected="selected"{/if}
                                            value="private">{l s='Private' mod='ptmarketplace'}</option>
                                </select>
                            </div>

                            <div class="form-group col-lg-12 ">
                                <div class="submit">
                                    <button type="submit" name="submitPtmarketplaceModule"
                                            class="btn btn-default pull-right"><i class="process-icon-save"></i>
                                        <span> {l s='Save' mod='ptmarketplace'}</span>
                                    </button>
                                </div>
                            </div>

                        </fieldset>

                    </form>

                </div>
            </div>
        </div>
    </div>

    <script type="application/javascript">
        $(document).ready(function () {

            loadCities('{$PTMARKETPLACE_OLX_REGION}', '{$PTMARKETPLACE_OLX_CITY}');

            $('#PTMARKETPLACE_OLX_REGION').on('change', function () {
                var regionId = $(this).find("option:selected").val();
                loadCities(regionId);
            });

            $('#PTMARKETPLACE_OLX_CITY').on('change', function () {
                var cityData = $(this).find("option:selected");

                $('#PTMARKETPLACE_OLX_LATITUDE').val(cityData.data('latitude'));
                $('#PTMARKETPLACE_OLX_LONGITUDE').val(cityData.data('longitude'));
                $('#PTMARKETPLACE_OLX_ZOOM').val(cityData.data('zoom'));
            });

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
                    var city = $('#PTMARKETPLACE_OLX_CITY');
                    city[0].options.length = 0;

                    for (var i = 0; i < data.length; i++) {
                        var selected = (data[i].id == cityId) ? "selected=\"selected\"" : "";
                        city.append('<option value="' + data[i].id + '" data-latitude="' + data[i].latitude + '" data-longitude="' + data[i].longitude + '" data-zoom="' + data[i].zoom + '" data-districts_city_id="' + data[i].districts_city_id + '" ' + selected + '>' + data[i].text + '</option>');
                    }
                },
                error: function () {
                    alert("{l s='Error reading city data' mod='ptmarketplace'}");
                }
            });
        }
    </script>

</div>
