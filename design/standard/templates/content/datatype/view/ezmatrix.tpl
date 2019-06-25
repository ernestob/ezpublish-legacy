{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{let matrix=$attribute.content}
<table class="list" cellspacing="0">
<tr>
{foreach $matrix.columns.sequential as $ColumnNames}
<th>{$ColumnNames.name|wash( xhtml )}</th>
{/foreach}
</tr>
{foreach $matrix.rows.sequential as $rows sequence array( bglight, bgdark ) as $rowSequence}
<tr class="{$rowSequence}">
    {foreach $rows.columns as $columns}
    <td>{$columns|wash( xhtml )}</td>
    {/foreach}
</tr>
{/foreach}
</table>
{/let}
