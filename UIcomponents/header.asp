<!--#include file="../RoutingDictionary.asp"-->
<nav class = 'navbar sticky-top navbar-light navbar-custom'>
    <div class=" container-custom container-fluid ">
        <a class ="nav-link active" href="../management.asp"><i class="lni lni-exit exit-icon"></i></a>
        <div class="page-address">
            <a href="<%=ParentUrl%>" class = "nav-link address"><%=Parent%></a>
            <span class='address-small'>></span>
            <a href="#" class='nav-link address'><%=CurrentPage%></a>
        </div>
        <a href="#" class="navbar-brand brand-custom">ODBG</a>
    </div>
</nav>
<script>
    var link = document.querySelector("link[rel~='icon']");
    if (!link) {
        link = document.createElement('link');
        link.rel = 'icon';
        document.head.appendChild(link);
    }
    link.href = '/Resources/logover2.ico';
</script>