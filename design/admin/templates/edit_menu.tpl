<div class="objectinfo">
{section show=eq(ezpreference('object_info'),'on')}
<h4>Object info <a class="showhide" href={"/user/preferences/set/object_info/off"|ezurl}>[-]</a></h4>
<p>
<label>{"Created"|i18n("design/standard/content/edit")}:</label>
{section show=$object.published}
{$object.published|l10n(date)}<br />
{$object.current.creator.name}
{section-else}
{"Not yet published"|i18n("design/standard/content/edit")}
{/section}
</p>
<p>
<label>{"Last Modified"|i18n("design/standard/content/edit")}:</label>
{section show=$object.modified}
{$object.modified|l10n(date)}<br />
{fetch( content, object, hash( object_id, $object.content_class.modifier_id ) ).name}
{section-else}
{"Not yet published"|i18n("design/standard/content/edit")}
{/section}
{section-else}
<h4>{"Object info"|i18n("design/admin/layout")} <a class="showhide" href={"/user/preferences/set/object_info/on"|ezurl}>[+]</a></h4>
{/section}
</p>
</div>


<div class="versions">
{section show=eq(ezpreference('versions'),'on')}
<h4>{"Versions"|i18n("design/standard/content/edit")} <a class="showhide" href={"/user/preferences/set/versions/off"|ezurl}>[-]</a></h4>
<p>
<label>{"Editing"|i18n("design/standard/content/edit")}:</label>
{$edit_version}
</p>
<p>
<label>{"Current"|i18n("design/standard/content/edit")}:</label>
{$object.current_version}
</p>
<input class="button" type="submit" name="VersionsButton" value="{'Manage'|i18n('design/standard/content/edit')}" />
<input class="button" type="submit" name="PreviewButton" value="{'Preview'|i18n('design/standard/content/edit')}" />
{section-else}
<h4>{"Versions"|i18n("design/standard/content/edit")} <a class="showhide" href={"/user/preferences/set/versions/on"|ezurl}>[+]</a></h4>
{/section}
</div>

<!-- Translation box start-->
<div class="translations">
{let name=Translation
     language_index=0
     default_translation=$content_version.translation
     other_translation_list=$content_version.translation_list
     translation_list=$Translation:other_translation_list|array_prepend($Translation:default_translation)}

{section show=$Translation:translation_list}
{section show=eq(ezpreference('translations'),'on')}
<h4>{"Translations"|i18n("design/standard/content/edit")} <a class="showhide" href={"/user/preferences/set/translations/off"|ezurl}>[-]</a></h4>

{section loop=$Translation:translation_list}
  {section show=eq($edit_language,$Translation:item.language_code)}
    {set language_index=$Translation:index}
  {/section}
{/section}

<p>
{section loop=$Translation:translation_list sequence=array("bgdark","bglight")}
<label>
{section show=$Translation:other_translation_list|gt(0)}
          <input type="radio" name="EditSelectedLanguage" value="{$Translation:item.language_code}" {section show=eq($Translation:index,$Translation:language_index)}checked="checked"{/section} />
{/section}
{section show=$Translation:item.locale.is_valid}
{$Translation:item.locale.intl_language_name}
{section-else}
{"%1 (No locale information available)"|i18n("design/standard/content/edit",,array($Translation:item.language_code))}
{/section}
</label>
{/section}
	  <input class="button" type="submit" name="TranslateButton" value="{'Manage'|i18n('design/standard/content/edit')}" />
{section show=$Translation:other_translation_list|gt(0)}
          <input class="button" type="submit" name="EditLanguageButton" value="{'Edit'|i18n('design/standard/content/edit')}" />
{/section}
{section-else}
<h4>{"Translations"|i18n("design/standard/content/edit")} <a class="showhide" href={"/user/preferences/set/translations/on"|ezurl}>[+]</a></h4>
{/section}
{/section}
</p>

{/let}
</div>

<!-- Translation box end-->

<!-- Dummy link tool START -->

<div class="linktool">
<h4>Internal link tool</h4>
<p>
<input class="button" type="submit" value="Create link code" />
<input class="linkbox" type="text" readonly="readonly" value="&lt;link id=123 /&gt;" />
</p>
</div>

<!-- Dummy link tool END -->

