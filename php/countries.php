<?php

$countries = array();
$count = 1;

$row = ORM::for_table($config['db']['pre'].'countries')
    ->where('active',1)
    ->order_by_asc('asciiname')
    ->find_many();
$total = count($row);
$divide = intval($total/4)+1;
$col = "";
foreach ($row as $info)
{
    $countrylang = getLangFromCountry($info['languages']);
    $countries[$count]['tpl'] = "";
    if($count == 1 or $count == $col){
        $countries[$count]['tpl'] .= '<div class="flag-list col-3 "><ul>';
        $checkEnd = $count+$divide-1;
        $col = $count+$divide;
        //echo "Start : ".$divide."<br>";
    }

    $countries[$count]['tpl'] .='<li data-name="{$info.name}" style="padding: 15px 0px">
                            <img class="svgflag flag-'.$info['code'].'" src="'.$config['site_url'].'templates/{TPL_NAME}/images/flags_svg/'.strtolower($info['code']).'.svg" class="flag-img"/>
                             <a href="'.$config['site_url'].'home/'.$countrylang.'/'.strtolower($info['code']).'"
                                        data-id="'.$info['id'].'" style="padding-left: 10px;"
                                        data-name="'.$info['asciiname'].'">'.$info['asciiname'].'</a></li>';



    /*$countries[$count]['tpl'] .= '<li><span class="margin-right-5 flag flag-'.strtolower($info['code']).'"></span><a href="'.$config['site_url'].'home/'.$countrylang.'/'.$info['code'].'" data-id="'.$info['id'].'" data-name="'.$info['asciiname'].'">'.$info['asciiname'].'</a></li>';
*/

    if($count == $checkEnd or $count == $total){
        $countries[$count]['tpl'] .= '</ul></div>';
        //echo "end : ".$checkEnd."<br>";
    }
    $count++;
}


$page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/countries.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header($lang['COUNTRY_PAGE_TITLE']));
$page->SetLoop ('COUNTRYLIST',$countries);
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();
?>
