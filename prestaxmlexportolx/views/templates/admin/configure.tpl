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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2015 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="panel">
	<div class="row moduleconfig-header">
		<div class="col-xs-5 text-right">
			<img src="{$module_dir|escape:'html':'UTF-8'}views/img/logo.jpg" />
		</div>
		<div class="col-xs-7 text-left">
			<h2>{l s='Lorem' mod='prestaxmlexportolx'}</h2>
			<h4>{l s='Lorem ipsum dolor' mod='prestaxmlexportolx'}</h4>
		</div>
	</div>

	<hr />

	<div class="moduleconfig-content">
		<div class="row">
			<div class="col-lg-12">
				<div class="col-lg-4">

					<form action="" method="post" id="olxStartupContent">
						<fieldset>
							<legend>{l s='Configurations' mod='prestaxmlexportolx'}:</legend>

                            <div class="form-group col-lg-12">
                                <label for="PRESTA_XML_EXPORT_OLX_REGION">{l s='Region' mod='prestaxmlexportolx'}:</label>
                                <select id="PRESTA_XML_EXPORT_OLX_REGION" name="PRESTA_XML_EXPORT_OLX_REGION">
                                    {foreach from=$PRESTA_XML_EXPORT_OLX_REGIONS item=region}
                                        <option value="{$region['id']}" {if $region['id'] == $PRESTA_XML_EXPORT_OLX_REGION}selected="selected"{/if}>{$region['name']}</option>
                                    {/foreach}
                                </select>
                            </div>

                            <div class="form-group col-lg-12">
                                <label for="PRESTA_XML_EXPORT_OLX_CITY">{l s='City' mod='prestaxmlexportolx'}:</label>
                                <select id="PRESTA_XML_EXPORT_OLX_CITY" name="PRESTA_XML_EXPORT_OLX_CITY" >
                                </select>
                            </div>

                            <div class="form-group col-lg-12">
                                <label for="PRESTA_XML_EXPORT_OLX_LATITUDE">{l s='Latitude' mod='prestaxmlexportolx'}:</label>
                                <input type="text" placeholder="latitude" id="PRESTA_XML_EXPORT_OLX_LATITUDE" name="PRESTA_XML_EXPORT_OLX_LATITUDE" value="{$PRESTA_XML_EXPORT_OLX_LATITUDE}" />
                            </div>

                            <div class="form-group col-lg-12">
                                <label for="PRESTA_XML_EXPORT_OLX_LONGITUDE">{l s='Longitude' mod='prestaxmlexportolx'}:</label>
                                <input type="text" placeholder="longitude" id="PRESTA_XML_EXPORT_OLX_LONGITUDE" name="PRESTA_XML_EXPORT_OLX_LONGITUDE" value="{$PRESTA_XML_EXPORT_OLX_LONGITUDE}" />
                            </div>

                            <div class="form-group col-lg-12">
                                <label for="PRESTA_XML_EXPORT_OLX_ZOOM">{l s='Zoom' mod='prestaxmlexportolx'}:</label>
                                <input type="text" placeholder="zoom" id="PRESTA_XML_EXPORT_OLX_ZOOM" name="PRESTA_XML_EXPORT_OLX_ZOOM" value="{$PRESTA_XML_EXPORT_OLX_ZOOM}" />
                            </div>

                            <div class="form-group col-lg-12 ">
                                <div class="submit">
                                    <button type="submit" name="submitPrestaxmlexportolxModule" class="btn btn-default pull-right"><i class="process-icon-save"></i><span> {l s='Save' mod='prestaxmlexportolx'}</span></button>
                                </div>
                            </div>

						</fieldset>

					</form>

				</div>
			</div>
		</div>
	</div>

    <script type="application/javascript">
        $(document).ready(function() {

            loadCities('{$PRESTA_XML_EXPORT_OLX_REGION}', '{$PRESTA_XML_EXPORT_OLX_CITY}');

            $('#PRESTA_XML_EXPORT_OLX_REGION').on('change', function() {
                var regionId = $(this).find("option:selected" ).val();
                loadCities(regionId);
            });

            $('#PRESTA_XML_EXPORT_OLX_CITY').on('change', function() {
                var cityData = $(this).find("option:selected" );

                $('#PRESTA_XML_EXPORT_OLX_LATITUDE').val(cityData.data('latitude'));
                $('#PRESTA_XML_EXPORT_OLX_LONGITUDE').val(cityData.data('longitude'));
                $('#PRESTA_XML_EXPORT_OLX_ZOOM').val(cityData.data('zoom'));
            });

        });

        function loadCities(regionId, cityId) {
            $.ajax({
                type: 'POST',
                headers: { "cache-control": "no-cache" },
                url: '{$module_dir}classes/ConfigCity.php',
                async: true,
                cache: false,
                dataType : "json",
                data: 'region_id=' + regionId,
                success: function(data)
                {
                    var city = $('#PRESTA_XML_EXPORT_OLX_CITY');
                    city[0].options.length = 0;

                    for (var i=0; i<data.length; i++) {
                        var selected = (data[i].id == cityId) ? "selected=\"selected\"" : "";
                        city.append('<option value="' + data[i].id + '" data-latitude="' + data[i].latitude + '" data-longitude="' + data[i].longitude + '" data-zoom="' + data[i].zoom + '" data-districts_city_id="' + data[i].districts_city_id + '" ' + selected + '>' + data[i].text + '</option>');
                    }
                },
                error: function()
                {
                    alert("{l s='Error reading city data' mod='prestaxmlexportolx'}");
                }
            });
        }
    </script>

</div>
