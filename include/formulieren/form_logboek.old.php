<form method="post" enctype="multipart/form-data" action="">       
    <ol>
        <li>
            <label for="datum">Datum</label>
        </li>
        <li>
            <label for="titel">Titel</label>
            <input name="titel" class="text large" type="text" value="<?php echo $titel; ?>" />
        </li>
        <li>
            <label for="inleiding">Inleiding</label>
            <textarea id="inleiding" name="inleiding" class="text area large"><?php echo $inleiding; ?></textarea>
        </li>    
        <li>
            <label for="tekst">Tekst</label>
            <textarea id="tekst" name="tekst" class="text area xxl" type="text"><?php echo $tekst; ?></textarea><script type="text/javascript">CKEDITOR.replace( 'tekst', { toolbar: 'Communiq', skin: 'v2' });</script>
        </li>
        <li>
            <label class="height" for="actief">Actief</label>
            <input type="radio" name="actief" id="actief" value="1" checked="checked"} /> Ja, pagina is actief <br/>
            <input type="radio" name="actief" id="actief" value="0" <?php if($actief == '0'){ echo ' checked="checked"';} ?> /> Nee, pagina is niet actief
        </li>
    </ol> 
    <a class="button annuleren" href="<?php echo $website.'/'.$url1;?>">annuleren</a>
    <button type="submit" name="submit" value="Opslaan" class="opslaan">Opslaan</button>
</form>