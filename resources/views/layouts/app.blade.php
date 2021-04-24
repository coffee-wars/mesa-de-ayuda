<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    {{-- Title from all pages load here, and defoult value is Inicio --}}
    <title>@yield('title','Inicio')</title>

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">


    <!-- Framework materializecss CSS CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Framework materializecss JS CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href={{ asset('css/common.css') }}>
    @yield('styles')

    @yield('scripts')
</head>

<body>
    <div id="app">

        <nav class="blue-grey darken-3">
            <div class="nav-wrapper">
                <a href="{{ route('home.index') }}" class="brand-logo">
                    <div class="cube-container">
                        <div class="cube">
                            <div class="cube__side" id="top"></div>
                            <div class="cube__side" id="front"></div>
                            <div class="cube__side" id="right"></div>
                            <div class="cube__side" id="left"></div>
                            <div class="cube__side" id="back"></div>
                            <div class="cube__side" id="bottom"></div>
                        </div>
                    </div>
                    Mesa de ayuda
                </a>
                <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                <ul class="right hide-on-med-and-down">
                    @guest
                        @if (Route::has('login'))
                            <li>
                                <a href="{{ route('login') }}">{{ __('Login') }}</a>
                            </li>
                        @endif

                        @if (Route::has('register'))
                            <li>
                                <a href="{{ route('register') }}">{{ __('Register') }}</a>
                            </li>
                        @endif
                    @endguest

                    @auth
                        <li>
                            <a href="{{ route('home.index') }}">Inicio</a>
                        </li>
                        <li>
                            <a class="dropdown-trigger" href="#!" data-target="dropdown1">
                                Areas
                                <i class="material-icons right">arrow_drop_down</i>
                            </a>
                            <!-- Dropdown Structure -->
                            <ul id="dropdown1" class="dropdown-content">
                                <li><a href="{{ route('areas.index') }}">Consultar</a></li>
                                <li><a href="{{ route('areas.create') }}">Crear</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="dropdown-trigger" href="#!" data-target="dropdown2">
                                Empleados
                                <i class="material-icons right">arrow_drop_down</i>
                            </a>
                            <!-- Dropdown Structure -->
                            <ul id="dropdown2" class="dropdown-content">
                                <li><a href="{{ route('empleados.index') }}">Consultar</a></li>
                                <li><a href="{{ route('empleados.create') }}">Registrar</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="dropdown-trigger" href="#!" data-target="dropdown3">
                                Cargos
                                <i class="material-icons right">arrow_drop_down</i>
                            </a>
                            <!-- Dropdown Structure -->
                            <ul id="dropdown3" class="dropdown-content">
                                <li><a href="{{ route('cargos.index') }}">Consultar</a></li>
                                <li><a href="{{ route('cargos.create') }}">Crear</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="dropdown-trigger" href="#!" data-target="dropdown4">
                                Requerimientos
                                <i class="material-icons right">arrow_drop_down</i>
                            </a>
                            <!-- Dropdown Structure -->
                            <ul id="dropdown4" class="dropdown-content">
                                <li><a href="{{ route('requerimientos.index') }}">Consultar</a></li>
                                <li><a href="{{ route('requerimientos.create') }}">Crear</a></li>
                            </ul>
                        </li>
                        <!-- Dropdown Trigger -->
                        <a class='dropdown-trigger btn blue-grey ' href='#' data-target='dropdown'>
                            {{ Auth::user()->name }}
                        </a>
                        <!-- Dropdown Structure -->
                        <ul id='dropdown' class='dropdown-content'>
                            <li>
                                <a href="{{ route('logout') }}" class="black-text"
                                    onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                    {{ __('Logout') }}
                                </a>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                    @csrf
                                </form>
                            </li>
                        </ul>
                    @endauth
                </ul>
            </div>
        </nav>

        <ul class="sidenav" id="mobile-demo">
            @auth
                <li>
                    <div class="user-view">
                        <div class="background">
                            <img src="">
                        </div>
                        <a href="#user"><img class="circle" src=""></a>
                        <a href="#name"><span class="black-text name">{{ Auth::user()->name }}</span></a>
                        <a href="#email"><span class="black-text email">{{ Auth::user()->email }}</span></a>
                    </div>
                </li>
                <li>
                    <a href="{{ route('home.index') }}">Inicio</a>
                </li>
                <li>
                    <a href="{{ route('areas.index') }}">Areas</a>
                </li>
                <li>
                    <a href="{{ route('empleados.index') }}">Empleados</a>
                </li>
                <li>
                    <a href="{{ route('cargos.index') }}">Cargos</a>
                </li>
                <li>
                    <a href="{{ route('requerimientos.index') }}">Requerimientos</a>
                </li>
                <li>
                    <a href="{{ url('/') }}">
                        <i class="material-icons">help_center</i>
                        {{ config('app.name', 'Laravel') }}
                    </a>
                </li>
            @endauth
            @guest
                @if (Route::has('login'))
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                    </li>
                @endif

                @if (Route::has('register'))
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                    </li>
                @endif
            @endguest
        </ul>

        <main class="py-4">
            @yield('content')
        </main>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('.sidenav');
            var instances = M.Sidenav.init(elems);
            var elems = document.querySelectorAll('.dropdown-trigger');
            var instances = M.Dropdown.init(elems);
            var elems = document.querySelectorAll('select');
            M.FormSelect.init(elems);
            var elems = document.querySelectorAll('.materialboxed');
            var instances = M.Materialbox.init(elems);
        });

    </script>
</body>

</html>
