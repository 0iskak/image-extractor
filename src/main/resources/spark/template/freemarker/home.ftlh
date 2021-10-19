<#import "template.ftlh" as t>
<@t.base>
    <div class="container has-text-centered pt-6">
        <span class="is-size-2 has-text-weight-bold is-uppercase">
            Images Extractor Tool
        </span>
        <form action="" method="POST" id="url-form"
              class="mx-auto mt-2 is-flex is-justify-content-space-between">
            <label class="control has-icons-left is-flex-grow-1">
                <input class="input is-large" type="text" name="URL" placeholder="Enter URL"
                       value=<#if URL??>
                           "${URL}"
                       </#if>>
                <span class="icon is-medium is-left">
                    <i data-feather="link"></i>
                </span>
            </label>
            <button type="submit" class="button is-primary is-large">EXTRACT</button>
        </form>
        <#if error??>
            <#if error>
                <script>
                    URLerror();
                </script>
            <#else>
                <@t.images_grid></@t.images_grid>
            </#if>
        </#if>
    </div>
</@t.base>