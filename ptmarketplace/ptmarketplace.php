<?php
/**
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
 * @author    Majoinfa, lda <info@majoinfa.com>
 * @copyright 2016 Majoinfa, lda
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */

if (!defined('_PS_VERSION_')) {
    exit;
}

require 'classes/OlxStartUpConfigs.php';
require 'classes/OlxBuildProductXml.php';

class Ptmarketplace extends Module
{
    protected $config_form = false;

    public function __construct()
    {
        $this->name = 'ptmarketplace';
        $this->tab = 'export';
        $this->version = '1.0.0';
        $this->author = 'Majoinfa, lda';
        $this->need_instance = 0;
        /**
         * Set $this->bootstrap to true if your module is compliant with bootstrap (PrestaShop 1.6)
         */
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Presta XML to OLX');
        $this->description = $this->l('Module to generates products xml files to import for olx ads');

        $this->confirmUninstall = $this->l('Are you shure you want to uninstall the module?');
    }

    /**
     * Don't forget to create update methods if needed:
     * http://doc.prestashop.com/display/PS16/Enabling+the+Auto-Update
     */
    public function install()
    {

        return parent::install() &&
            $this->registerHook('header') &&
            $this->registerHook('backOfficeHeader') &&
            $this->registerHook('displayAdminOrder') &&
            $this->registerHook('displayAdminProductsExtra');
    }


    /**
     * Load the configuration form
     */
    public function getContent()
    {
        /**
         * If values have been submitted in the form, process.
         */
        if (Tools::isSubmit('submitPtmarketplaceModule')) {
            $this->postProcess();
        }

        $this->assignConfiguration();

        $this->context->smarty->assign('module_dir', $this->_path);
        $output = $this->context->smarty->fetch($this->local_path . 'views/templates/admin/configure.tpl');

        return $output;
    }

    /**
     * Get values from database.
     */
    protected function getConfigDefaultValues()
    {
        return array(
            'PTMARKETPLACE_OLX_REGION' => Configuration::get('PTMARKETPLACE_OLX_REGION'),
            'PTMARKETPLACE_OLX_CITY' => Configuration::get('PTMARKETPLACE_OLX_CITY'),
            'PTMARKETPLACE_OLX_LATITUDE' => Configuration::get('PTMARKETPLACE_OLX_LATITUDE'),
            'PTMARKETPLACE_OLX_LONGITUDE' => Configuration::get('PTMARKETPLACE_OLX_LONGITUDE'),
            'PTMARKETPLACE_OLX_ZOOM' => Configuration::get('PTMARKETPLACE_OLX_ZOOM'),
            'PTMARKETPLACE_OLX_PERSON' => Configuration::get('PTMARKETPLACE_OLX_PERSON'),
            'PTMARKETPLACE_OLX_PHONE' => Configuration::get('PTMARKETPLACE_OLX_PHONE'),
            'PTMARKETPLACE_OLX_ADV_TYPE' => Configuration::get('PTMARKETPLACE_OLX_ADV_TYPE'),
        );
    }

    /**
     * Get values from form.
     */
    protected function getConfigFormValues()
    {
        return array(
            'PTMARKETPLACE_OLX_REGION' => Tools::getValue('PTMARKETPLACE_OLX_REGION'),
            'PTMARKETPLACE_OLX_CITY' => Tools::getValue('PTMARKETPLACE_OLX_CITY'),
            'PTMARKETPLACE_OLX_LATITUDE' => Tools::getValue('PTMARKETPLACE_OLX_LATITUDE'),
            'PTMARKETPLACE_OLX_LONGITUDE' => Tools::getValue('PTMARKETPLACE_OLX_LONGITUDE'),
            'PTMARKETPLACE_OLX_ZOOM' => Tools::getValue('PTMARKETPLACE_OLX_ZOOM'),
            'PTMARKETPLACE_OLX_PERSON' => Tools::getValue('PTMARKETPLACE_OLX_PERSON'),
            'PTMARKETPLACE_OLX_PHONE' => Tools::getValue('PTMARKETPLACE_OLX_PHONE'),
            'PTMARKETPLACE_OLX_ADV_TYPE' => Tools::getValue('PTMARKETPLACE_OLX_ADV_TYPE'),
        );
    }

    /**
     * Save form data.
     */
    protected function postProcess()
    {
        $form_values = $this->getConfigFormValues();

        foreach (array_keys($form_values) as $key) {
            Configuration::updateValue($key, Tools::getValue($key));
        }
    }

    /**
     * Load data to form
     */
    public function assignConfiguration()
    {
        $values = $this->getConfigDefaultValues();

        foreach ($values as $key => $value) {
            $this->context->smarty->assign($key, $value);
        }

        $regions = OlxStartConfigs::getRegions();

        $this->context->smarty->assign('PTMARKETPLACE_OLX_REGIONS', $regions);
    }

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

    /**
     * @return mixed
     */
    public function hookDisplayAdminProductsExtra()
    {

        $this->processProduct();

        $default_language = Configuration::get('PS_LANG_DEFAULT');
        $default_shop_id = Configuration::get('PS_SHOP_DEFAULT');
        $id_product = (int)Tools::getValue('id_product');

        if (Validate::isLoadedObject(
            $product = new Product(
                $id_product,
                false,
                $default_language,
                $default_shop_id,
                null
            )
        )
        ) {

            $this->context->smarty->assign('PTMARKETPLACE_OLX_EXTERNAL_ID', $product->reference);
            $this->context->smarty->assign('PTMARKETPLACE_OLX_TITLE', $product->reference);
            $this->context->smarty->assign('PTMARKETPLACE_OLX_DESCRIPTION', $product->description);
            $this->context->smarty->assign('PTMARKETPLACE_OLX_PRICE', $product->price);

            $this->assignConfiguration();

            $product_type = OlxBuildProductXml::productType();
            $this->context->smarty->assign('PTMARKETPLACE_OLX_PRODUCTS', $product_type);
        }

        $this->context->smarty->assign('module_dir', $this->_path);
        $output = $this->context->smarty->fetch($this->local_path . 'views/templates/hook/displayAdminProductsExtra.tpl');

        return $output;
    }
}
