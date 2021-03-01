@extends('layouts.admin')
@section('content')
<div class="main-panel">
<div class="content-wrapper">
<div class="card">
    <div class="card-header">
        {{ trans('global.create') }} Dividend
    </div>

    <div class="card-body">
        <form action="{{ route("admin.divident.store") }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                <label for="divident_amount">Total Dividend Amount*</label>
                <input type="number" id="divident_amount" name="divident_amount" class="form-control"  required>
                @if($errors->has('divident_amount'))
                    <em class="invalid-feedback">
                        {{ $errors->first('divident_amount') }}
                    </em>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.ability.fields.name_helper') }}
                </p>
            </div>
            <input type="hidden" name="user_id" value="{{auth()->user()->id}}">
            <div>
                <input class="btn btn-danger" type="submit" value="{{ trans('global.save') }}">
            </div>
        </form>


    </div>
</div>
</div>
</div>
@endsection