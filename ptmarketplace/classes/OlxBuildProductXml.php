<?php

class OlxBuildProductXml
{
    private $adverts;

    public function __construct(){
        $this->adverts = new SimpleXMLElement('<?xml version="1.0" encoding="UTF-8" ?><adverts/>');
    }

    /**
     * Add new product to products list
     * @param $data
     */
    public function addProduct($data) {
        self::advertInfo($this->adverts, $data);
    }

    /**
     * Generate xml string
     * @return mixed
     */
    public function getXml($filename) {
        return $this->adverts->asXML($filename);
    }

    /**
     * Build advert
     * @param $adverts
     * @param $data
     */
    public static function advertInfo($adverts, $data) {
        $advert = $adverts->addChild('advert');

        $advert->addChild('category_id', $data['category_id']);
        $advert->addChild('title', htmlspecialchars($data['title'], ENT_XML1, 'UTF-8'));
        $advert->addChild('description', htmlspecialchars($data['description'], ENT_XML1, 'UTF-8'));
        $advert->addChild('external_id', $data['external_id']);
        $advert->addChild('region_id', $data['region_id']);
        $advert->addChild('city_id', $data['city_id']);

        $coordinates = $advert->addChild('coordinates');
        $coordinates->addChild('longitude', $data['longitude']);
        $coordinates->addChild('latitude', $data['latitude']);
        $coordinates->addChild('zoom_level', $data['zoom_level']);

        $advert->addChild('advertiser_type', $data['advertiser_type']);

        $contact = $advert->addChild('contact');
        $contact->addChild('person', htmlspecialchars($data['person'], ENT_XML1, 'UTF-8'));
        $contact->addChild('phone_numbers', $data['phone_numbers']);

        $images = $advert->addChild('images');

        if (isset($data['images'])) {
            foreach ($data['images'] as &$img) {
                $images->addChild('image', $img);
            }
        }

        $params = $advert->addChild('params');

        $price = $params->addChild('param');
        $price->addAttribute('code', 'price');
        $price->addChild('value', isset($data['price']['value']) ? $data['price']['value'] : 0);
        $price->addChild('type', isset($data['price']['type']) ? $data['price']['type'] : "price");

        if (isset($data['product_type'])) {
            $product = $params->addChild('param', $data['product_type']['value']);
            $product->addAttribute('code', $data['product_type']['code']);
        }
    }

    /**
     * List of all products
     * @return array
     */
    public static function productType() {
        return array(
            array("id" => "290", "type" => "Bebe e criança", "name" => "Segurança"),
            array("id" => "291", "type" => "Bebe e criança", "name" => "Relaxar"),
            array("id" => "292", "type" => "Bebe e criança", "name" => "Roupinha"),
            array("id" => "293", "type" => "Bebe e criança", "name" => "Calçado"),
            array("id" => "294", "type" => "Bebe e criança", "name" => "Passeio"),
            array("id" => "295", "type" => "Bebe e criança", "name" => "Refeição"),

            array("id" => "205", "type" => "Desporto", "name" => "Suf"),
            array("id" => "234", "type" => "Desporto", "name" => "Artigos"),
            array("id" => "9", "type" => "Desporto", "name" => "Bicicletas"),

            array("id" => "211", "type" => "Lazer", "name" => "Brinquedos"),
            array("id" => "214", "type" => "Lazer", "name" => "Colecções"),
            array("id" => "243", "type" => "Lazer", "name" => "Instrumentos"),
            array("id" => "9", "type" => "Lazer", "name" => "Bicicletas"),
            array("id" => "4677", "type" => "Lazer", "name" => "Livros - Revistas - Livros Escolares"),
            array("id" => "4637", "type" => "Lazer", "name" => "Livros - Revistas - Arte"),
            array("id" => "4639", "type" => "Lazer", "name" => "Livros - Revistas - Auto-ajuda"),
            array("id" => "4641", "type" => "Lazer", "name" => "Livros - Revistas - Banda Desenhada"),
            array("id" => "4643", "type" => "Lazer", "name" => "Livros - Revistas - Ciências Naturais"),
            array("id" => "4645", "type" => "Lazer", "name" => "Livros - Revistas - Ciências Sociais"),
            array("id" => "4647", "type" => "Lazer", "name" => "Livros - Revistas - Desporto"),
            array("id" => "4649", "type" => "Lazer", "name" => "Livros - Revistas - Dicionários"),
            array("id" => "4651", "type" => "Lazer", "name" => "Livros - Revistas - Dinheiros"),
            array("id" => "4653", "type" => "Lazer", "name" => "Livros - Revistas - Direito"),
            array("id" => "4655", "type" => "Lazer", "name" => "Livros - Revistas - Educação"),
            array("id" => "4657", "type" => "Lazer", "name" => "Livros - Revistas - Enciclopédias"),
            array("id" => "4659", "type" => "Lazer", "name" => "Livros - Revistas - Engenharia"),
            array("id" => "4661", "type" => "Lazer", "name" => "Livros - Revistas - Gastronomia"),
            array("id" => "4663", "type" => "Lazer", "name" => "Livros - Revistas - Gestão"),
            array("id" => "4665", "type" => "Lazer", "name" => "Livros - Revistas - História"),
            array("id" => "4667", "type" => "Lazer", "name" => "Livros - Revistas - Informática"),
            array("id" => "4669", "type" => "Lazer", "name" => "Livros - Revistas - Jovem"),
            array("id" => "4671", "type" => "Lazer", "name" => "Livros - Revistas - Lazer"),
            array("id" => "4673", "type" => "Lazer", "name" => "Livros - Revistas - Literatura Internacional"),
            array("id" => "4675", "type" => "Lazer", "name" => "Livros - Revistas - Literatura Portuguesa"),
            array("id" => "4679", "type" => "Lazer", "name" => "Livros - Revistas - Mapas"),
            array("id" => "4681", "type" => "Lazer", "name" => "Livros - Revistas - Política"),
            array("id" => "4683", "type" => "Lazer", "name" => "Livros - Revistas - Práticos"),
            array("id" => "4685", "type" => "Lazer", "name" => "Livros - Revistas - Religião"),
            array("id" => "4687", "type" => "Lazer", "name" => "Livros - Revistas - Revistas"),
            array("id" => "4689", "type" => "Lazer", "name" => "Livros - Revistas - Saúde"),
            array("id" => "4691", "type" => "Lazer", "name" => "Livros - Revistas - Viagens"),
            array("id" => "4860", "type" => "Lazer", "name" => "Livros - Revistas - Outra não listada"),
            array("id" => "402", "type" => "Lazer", "name" => "Bilhetes"),

            array("id" => "402", "type" => "Moda", "name" => "Jóias"),
            array("id" => "23", "type" => "Moda", "name" => "Malas"),
            array("id" => "4693", "type" => "Moda", "name" => "Roupa - Acessórios"),
            array("id" => "4695", "type" => "Moda", "name" => "Roupa - Homem"),
            array("id" => "4697", "type" => "Moda", "name" => "Roupa - Mulher"),
            array("id" => "4699", "type" => "Moda", "name" => "Roupa - Trajes"),
            array("id" => "22", "type" => "Moda", "name" => "Calçado"),
            array("id" => "4701", "type" => "Moda", "name" => "Saúde - Beleza - Cabelo"),
            array("id" => "4703", "type" => "Moda", "name" => "Saúde - Beleza - Cuidado De Mãos"),
            array("id" => "4705", "type" => "Moda", "name" => "Saúde - Beleza - Cuidado De Pés"),
            array("id" => "4707", "type" => "Moda", "name" => "Saúde - Beleza - Cuidado De Rosto"),
            array("id" => "4709", "type" => "Moda", "name" => "Saúde - Beleza - Cuidado Para O Corpo"),
            array("id" => "4711", "type" => "Moda", "name" => "Saúde - Beleza - Equipamentos Médicos"),
            array("id" => "4713", "type" => "Moda", "name" => "Saúde - Beleza - Higiene Oral"),
            array("id" => "4715", "type" => "Moda", "name" => "Saúde - Beleza - Maquilhagem"),
            array("id" => "4717", "type" => "Moda", "name" => "Saúde - Beleza - Perfumes"),
            array("id" => "4719", "type" => "Moda", "name" => "Saúde - Beleza - Solares"),

            array("id" => "599", "type" => "Moveis Casa Jardim", "name" => "Utilitarios"),
            array("id" => "20", "type" => "Moveis Casa Jardim", "name" => "Eletrodomésticos"),
            array("id" => "21", "type" => "Moveis Casa Jardim", "name" => "Jardim"),
            array("id" => "228", "type" => "Moveis Casa Jardim", "name" => "Móveis"),

            array("id" => "209", "type" => "Tecnologia", "name" => "Videojogos - Consolas"),
            array("id" => "4721", "type" => "Tecnologia", "name" => "Computadores - Informática - Acessórios"),
            array("id" => "4723", "type" => "Tecnologia", "name" => "Computadores - Informática - Acessórios para Portáteis"),
            array("id" => "4725", "type" => "Tecnologia", "name" => "Computadores - Informática - Apple"),
            array("id" => "4727", "type" => "Tecnologia", "name" => "Computadores - Informática - Armazenamento"),
            array("id" => "4729", "type" => "Tecnologia", "name" => "Computadores - Informática - Componentes"),
            array("id" => "4731", "type" => "Tecnologia", "name" => "Computadores - Informática - Computadores"),
            array("id" => "4733", "type" => "Tecnologia", "name" => "Computadores - Informática - Consumíveis Impressora"),
            array("id" => "4735", "type" => "Tecnologia", "name" => "Computadores - Informática - Discos Externos"),
            array("id" => "4737", "type" => "Tecnologia", "name" => "Computadores - Informática - Discos Rígidos"),
            array("id" => "4739", "type" => "Tecnologia", "name" => "Computadores - Informática - Fax"),
            array("id" => "4741", "type" => "Tecnologia", "name" => "Computadores - Informática - Fotocopiadoras"),
            array("id" => "4743", "type" => "Tecnologia", "name" => "Computadores - Informática - Impressoras"),
            array("id" => "4745", "type" => "Tecnologia", "name" => "Computadores - Informática - Monitores"),
            array("id" => "4747", "type" => "Tecnologia", "name" => "Computadores - Informática - Multifunções"),
            array("id" => "4749", "type" => "Tecnologia", "name" => "Computadores - Informática - Netbooks"),
            array("id" => "4861", "type" => "Tecnologia", "name" => "Computadores - Informática - Outra não listada"),
            array("id" => "4751", "type" => "Tecnologia", "name" => "Computadores - Informática - Periféricos"),
            array("id" => "4753", "type" => "Tecnologia", "name" => "Computadores - Informática - Portáteis"),
            array("id" => "4755", "type" => "Tecnologia", "name" => "Computadores - Informática - Processadores"),
            array("id" => "4757", "type" => "Tecnologia", "name" => "Computadores - Informática - Projectores"),
            array("id" => "4759", "type" => "Tecnologia", "name" => "Computadores - Informática - Redes"),
            array("id" => "4761", "type" => "Tecnologia", "name" => "Computadores - Informática - Scanners"),
            array("id" => "4763", "type" => "Tecnologia", "name" => "Computadores - Informática - Servidores"),
            array("id" => "4765", "type" => "Tecnologia", "name" => "Computadores - Informática - Software"),
            array("id" => "4767", "type" => "Tecnologia", "name" => "Computadores - Informática - Tablets"),
            array("id" => "366", "type" => "Tecnologia", "name" => "Electrónica"),
            array("id" => "4771", "type" => "Tecnologia", "name" => "TV, Som e Fotografia - Fotografia"),
            array("id" => "4773", "type" => "Tecnologia", "name" => "TV, Som e Fotografia - Som"),
            array("id" => "4769", "type" => "Tecnologia", "name" => "TV, Som e Fotografia - TV"),

            array("id" => "27", "type" => "Telemóveis", "name" => "Acessórios"),
            array("id" => "219", "type" => "Telemóveis", "name" => "Telemóveis"),
            array("id" => "598", "type" => "Telemóveis", "name" => "Tablets")
        );
    }

}