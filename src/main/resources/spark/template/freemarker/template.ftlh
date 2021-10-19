<#assign TITLE = "Image Exractor">

<#macro base title="">
    <!doctype html>
    <html lang="en">
    <head>
        <title>
            <#if title?has_content>
                ${title}
            <#else>
                ${TITLE}
            </#if>
        </title>

        <link rel="icon" type="image/png" href="/img/picture.png">
        <link rel="stylesheet" href="/css/main.css">
        <script src="https://unpkg.com/feather-icons"></script>
        <script src="/bulma-toast/dist/bulma-toast.min.js"></script>
        <script src="/script/main.js"></script>
    </head>
    <body>
            <header>
                <@header></@header>
            </header>

            <#nested>
        <script>
            feather.replace()
        </script>
    </body>
    </html>
</#macro>

<#macro header>
    <nav class="navbar is-primary" role="navigation">
        <div class="container">
            <a href="/" class="navbar-brand">
                <div class="navbar-item">
                    <img src="/img/picture.png" alt="logo">
                    <#assign s = TITLE?split(" ")>
                    <span class="ml-2 has-text-weight-medium">
                        ${s[0]}<br>
                        ${s[1]}
                    </span>
                </div>
            </a>
            <div class="navbar-menu">
                <div class="navbar-end">
                    <a href="https://github.com/0iskak/image-extractor" class="navbar-item">
                        <i data-feather="github"></i>
                    </a>
                </div>
            </div>
        </div>
    </nav>
</#macro>

<#--unused-->
<#macro images_header>
    <div class="is-primary is-flex">
        <div class="dropdown">
            <div class="dropdown-trigger">
                <button class="button is-medium" onclick="dropdown()">
                    <span>Sort by: </span>
                    <span class="icon is-small mt-1">
                        <i data-feather="chevron-down" stroke-width="1.5"></i>
                    </span>
                </button>
            </div>
            <div class="dropdown-menu" id="dropdown-menu">
                <div class="dropdown-content">
                    <div class="dropdown-item">
                        <span>Sort direction</span>
                        <button class="button">
                            <i data-feather="arrow-down"></i>
                        </button>
                        <button class="button">
                            <i data-feather="arrow-up"></i>
                        </button>
                    </div>
                    <hr class="dropdown-divider">
                    <div class="dropdown-item">
                        <button class="button">
                            Order on page
                        </button>
                    </div>
                    <div class="dropdown-item">
                        <button class="button">
                            Image size
                        </button>
                    </div>
                    <div class="dropdown-item">
                        <button class="button">
                            Image width
                        </button>
                    </div>
                    <div class="dropdown-item">
                        <button class="button">
                            Image height
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</#macro>

<#macro images_grid>
    <div class="columns is-flex-wrap-wrap mt-6" id="images">
        <#list files as f>
            <div class="column is-2 is-6-touch image-column">
                <div class="card">
                    <div class="card-image">
                        <figure class="image">
                            <img src="${f}" alt="">
                        </figure>
                    </div>
                    <div class="card-content">
                        <div class="content">
                            <a href="${f}" class="is-link">Link</a>
                        </div>
                    </div>
                </div>
            </div>
        </#list>
        <#list embedded as e>
            <div class="column is-2 is-6-touch image-column">
                <div class="card">
                    <div class="card-image">
                        <figure class="image">
                            ${e}
                        </figure>
                    </div>
                    <div class="card-content">
                        <div class="content">
                            <span>Embedded image</span>
                        </div>
                    </div>
                </div>
            </div>
        </#list>
    </div>
</#macro>