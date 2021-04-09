@extends('layouts.base')
@section('title', 'Consultar area')

@section('content')
    <div class="container">
        <div class="jumbotron">
            <h2 class="center-align">Buscar cargo</h2>
            <div class="row">
                <form action={{ route('cargos.show') }} method="GET" class="col s12">
                    @csrf
                    <div class="row">
                        <div class="input-field col s12">
                            <input type="number" class="validate" name="IDCARGO" required>
                            <label for="IDCARGO">Id cargo</label>
                        </div>
                        @error('IDCARGO')
                            <small class="red-text">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="center">
                        <a href={{ route('cargos.index') }} class="btn waves-effect waves-light grey darken-2">
                            <i class="material-icons left">arrow_back</i>Volver
                        </a>
                        <button class="btn waves-effect waves-light grey darken-2" type="submit" name="action">Buscar
                            <i class="material-icons right">search</i>
                        </button>
                    </div>
                </form>
            </div>
            {{-- @if ($errors->any())
                @error('notExist')
                    <div class="alert alert-danger center" role="alert">
                        {{ $message }}
                    </div>
                @enderror
            @endif --}}

        </div>
    </div>
@endsection
