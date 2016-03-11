<header id="header" class="nav-main">
  <div class="row wrapper">
    <div class="col-w-1-5">
        <a href="{{ url_for_lang('') }}" class="logo">SSJ</a>
    </div>
    <div class="col-w-3-5">
      <nav class="menu">
        <ul class="menu-list menu-horizontal">
          {{ header_menu('menu') }}
        </ul>
      </nav>
    </div>
    <div class="col-w-1-5">
      <div class="main-search">
        <a href="#" class="menu-search"><i class="fa fa-search"></i></a>
      </div>
      <a id="mobile-nav-toggle">
        <span class="mobile-nav-toggle-bar"></span>
        <span class="mobile-nav-toggle-bar"></span>
        <span class="mobile-nav-toggle-bar"></span>
      </a>
      <a id="mobile-search-btn" class="st-search-launcher"></a>
    </div>
  </div>
</header>