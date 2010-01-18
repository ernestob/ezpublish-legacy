<div id="content-tree">

{* DESIGN: Header START *}<div class="box-header"><div class="box-ml">

{if ezpreference( 'admin_treemenu' )}
<h4><a class="show-hide-control" href={'/user/preferences/set/admin_treemenu/0'|ezurl} title="Hide media library.">-</a> {'Media library'|i18n( 'design/admin/parts/media/menu' )}</h4>
{else}
<h4><a class="show-hide-control" href={'/user/preferences/set/admin_treemenu/1'|ezurl} title="Show media library.">+</a> {'Media library'|i18n( 'design/admin/parts/media/menu' )}</h4>
{/if}

{* DESIGN: Header END *}</div></div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-content">

{* Treemenu. *}
<div id="contentstructure">
{if ezpreference( 'admin_treemenu' )}
    {if ezini('TreeMenu','Dynamic','contentstructuremenu.ini')|eq('enabled')}
        {include uri='design:contentstructuremenu/content_structure_menu_dynamic.tpl' custom_root_node_id=ezini( 'NodeSettings', 'MediaRootNode', 'content.ini')}
    {else}
        {include uri='design:contentstructuremenu/content_structure_menu.tpl' custom_root_node_id=ezini( 'NodeSettings', 'MediaRootNode', 'content.ini')}
    {/if}
{/if}
</div>

{* Trashcan. *}
{if ne( $ui_context, 'browse' )}
<div id="trash">
<a class="image-text" href={concat( '/content/trash/', ezini( 'NodeSettings', 'RootNode', 'content.ini' ) )|ezurl} title="{'View and manage the contents of the trash bin.'|i18n( 'design/admin/parts/media/menu' )}"><img src={'trash-icon-16x16.gif'|ezimage} width="16" height="16" alt="Trash" />&nbsp;<span>{'Trash'|i18n( 'design/admin/parts/media/menu' )}</span></a>
</div>
{/if}

{* DESIGN: Content END *}</div></div></div>

</div>


{* See parts/ini_menu.tpl and menu.ini for more info, or parts/setup/menu.tpl for full example *}
{include uri='design:parts/ini_menu.tpl' ini_section='Leftmenu_media' i18n_hash=hash()}


{* Left menu width control. *}
<div class="widthcontrol">
<p>
{switch match=ezpreference( 'admin_left_menu_size' )}
    {case match='medium'}
    <a href={'/user/preferences/set/admin_left_menu_size/small'|ezurl} title="{'Change the left menu width to small size.'|i18n( 'design/admin/parts/media/menu' )}">{'Small'|i18n( 'design/admin/parts/media/menu' )}</a>
    <span class="current">{'Medium'|i18n( 'design/admin/parts/media/menu' )}</span>
    <a href={'/user/preferences/set/admin_left_menu_size/large'|ezurl} title="{'Change the left menu width to large size.'|i18n( 'design/admin/parts/media/menu' )}">{'Large'|i18n( 'design/admin/parts/media/menu' )}</a>
    {/case}

    {case match='large'}
    <a href={'/user/preferences/set/admin_left_menu_size/small'|ezurl} title="{'Change the left menu width to small size.'|i18n( 'design/admin/parts/media/menu' )}">{'Small'|i18n( 'design/admin/parts/media/menu' )}</a>
    <a href={'/user/preferences/set/admin_left_menu_size/medium'|ezurl} title="{'Change the left menu width to medium size.'|i18n( 'design/admin/parts/media/menu' )}">{'Medium'|i18n( 'design/admin/parts/media/menu' )}</a>
    <span class="current">{'Large'|i18n( 'design/admin/parts/media/menu' )}</span>
    {/case}

    {case in=array( 'small', '' )}
    <span class="current">{'Small'|i18n( 'design/admin/parts/media/menu' )}</span>
    <a href={'/user/preferences/set/admin_left_menu_size/medium'|ezurl} title="{'Change the left menu width to medium size.'|i18n( 'design/admin/parts/media/menu' )}">{'Medium'|i18n( 'design/admin/parts/media/menu' )}</a>
    <a href={'/user/preferences/set/admin_left_menu_size/large'|ezurl} title="{'Change the left menu width to large size.'|i18n( 'design/admin/parts/media/menu' )}">{'Large'|i18n( 'design/admin/parts/media/menu' )}</a>
    {/case}

    {case}
    <a href={'/user/preferences/set/admin_left_menu_size/small'|ezurl} title="{'Change the left menu width to small size.'|i18n( 'design/admin/parts/media/menu' )}">{'Small'|i18n( 'design/admin/parts/media/menu' )}</a>
    <a href={'/user/preferences/set/admin_left_menu_size/medium'|ezurl} title="{'Change the left menu width to medium size.'|i18n( 'design/admin/parts/media/menu' )}">{'Medium'|i18n( 'design/admin/parts/media/menu' )}</a>
    <a href={'/user/preferences/set/admin_left_menu_size/large'|ezurl} title="{'Change the left menu width to large size.'|i18n( 'design/admin/parts/media/menu' )}">{'Large'|i18n( 'design/admin/parts/media/menu' )}</a>
    {/case}
{/switch}
</p>
</div>

<script language="javascript" type="text/javascript" src={"javascript/leftmenu_widthcontrol.js"|ezdesign} charset="utf-8"></script>
