@extends('layouts.app')
@section('title','Slider')

@push('css')

@endpush

@section('content')
<div class="card my-4">
    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
        <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
            <h6 class="text-white text-capitalize ps-3">New Slider</h6>
        </div>
    </div>
    <div class="card-content">
        <form role="form" action="{{route('admin.slider.update', $slider->id)}}" method="POST" enctype="multipart/form-data" class="text-start">
            @csrf
            @method('PUT')
            <label class="form-label mt-3">Slider Name</label>
            <div class="input-group input-group-outline">
                <input type="text" name="name" value="{{$slider->name}}" class="form-control">
            </div>
            <label class="form-label mt-3">Slider Description</label>
            <div class="input-group input-group-outline">
                <textarea name="description" class="form-control">{{$slider->description}}</textarea>
            </div>
            <label class="form-label my-2">Slider Image</label>
            <div class="input-group input-group-outline">
                <input type="file" name="image" id="editimage" value="{{$slider->image}}" class="form-control">
            </div>
            <div class="form-group my-2">
                <small>Recent image: </small>
                <img class="img-thumbnail img-responsive" src="{{url('uploads/slider/'. $slider->image)}}" alt="image" style="height: 70px; width:90px;">
            </div>
            <a href="{{ route('admin.slider.index') }}" class="btn btn-danger">Cancel</a>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</div>


@endsection

@push('js')

@endpush