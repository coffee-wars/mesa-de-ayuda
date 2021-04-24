@extends('layouts.app')
@section('title', 'Consultar empleado')

@section('content')
    <div class="container">
        <div class="card hiverable mt-15 p-3 hoverable">
            <h2 class="center-align">Buscar empleado</h2>
            <div class="row">
                <form action={{ route('empleados.show') }} method="GET" class="col s12">
                    @csrf
                    <div class="row">
                        <div class="input-field col s12">
                            <input type="text" class="validate" name="IDEMPLEADO" required>
                            <label for="IDEMPLEADO">Código del empleado *</label>
                            @error('IDEMPLEADO')
                                <small class="red-text">{{ $message }}</small>
                            @enderror
                        </div>
                        <small class="blue-grey-text right hide-on-med-and-down">Los campos que contengan un <span
                                class="bold">*</span> son
                            obligatorios</small>
                        <small class="blue-grey-text left hide-on-large-only">Los campos que contengan un <span
                                class="bold">*</span> son
                            obligatorios</small>
                    </div>
                    <div class="center">
                        <a href={{ route('empleados.index') }} class="btn waves-effect waves-light grey darken-2">
                            <i class="material-icons left">arrow_back</i>Volver
                        </a>
                        <button class="btn waves-effect waves-light grey darken-2" type="submit" name="action">Buscar
                            <i class="material-icons right">search</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
