<?php
/**
 * 2007-2015 PrestaShop
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2015 PrestaShop SA
 * @license   http://addons.prestashop.com/en/content/12-terms-and-conditions-of-use
 * International Registered Trademark & Property of PrestaShop SA
 * require_once dirname(__FILE__).'/../../classes/OlxBuildProductXml.php';
 */


class AdminPTMarketPlaceController extends ModuleAdminController
{

    /**
     * @return array
     */
    public function getSingleproduct()
    {
        return array(
            'category_id' => Tools::getValue('PTMARKETPLACE_OLX_PRODUCT_TYPE'),
            'title' => Tools::getValue('PTMARKETPLACE_OLX_TITLE'),
            'description' => Tools::getValue('PTMARKETPLACE_OLX_DESCRIPTION'),
            'external_id' => Tools::getValue('PTMARKETPLACE_OLX_EXTERNAL_ID'),
            'region_id' => Tools::getValue('PTMARKETPLACE_OLX_REGION'),
            'city_id' => Tools::getValue('PTMARKETPLACE_OLX_CITY'),
            'longitude' => Tools::getValue('PTMARKETPLACE_OLX_LONGITUDE'),
            'latitude' => Tools::getValue('PTMARKETPLACE_OLX_LATITUDE'),
            'zoom_level' => Tools::getValue('PTMARKETPLACE_OLX_ZOOM'),
            'person' => Tools::getValue('PTMARKETPLACE_OLX_PERSON'),
            'phone_numbers' => Tools::getValue('PTMARKETPLACE_OLX_PHONE'),
            'advertiser_type' => Tools::getValue('PTMARKETPLACE_OLX_ADV_TYPE'),
            'price' => array(
                "type" => "price", "value" => Tools::getValue('PTMARKETPLACE_OLX_PRICE'),
            )
        );

    }


    /**
     *
     */
    public function processProduct()
    {

        if (!empty($_POST['PTMARKETPLACE_OLX_PRODUCT_TYPE'])
            && !empty($_POST['PTMARKETPLACE_OLX_TITLE'])
            && !empty($_POST['PTMARKETPLACE_OLX_PRICE'])
        ) {

            $data = $this->getSingleproduct();

            $olx = new OlxBuildProductXml();
            $file = date('Y-m-d') . '_' . $data["title"] . '.xml';

            $olx->addProduct($data);
            $olx->getXml($file);

            if (file_exists($file)) {
                header('Content-Description: File Transfer');
                header('Content-Type: text/xml');
                header('Content-Disposition: attachment; filename="' . basename($file) . '"');
                header('Expires: 0');
                header('Cache-Control: must-revalidate');
                header('Pragma: public');
                header('Content-Length: ' . filesize($file));
                readfile($file);
                exit;
            }
        }
    }

}