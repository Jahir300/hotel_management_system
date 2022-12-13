@extends('layouts.app')
@section('title','Slider')

@push('css')

@endpush

@section('content')
<div class="col-12">
    @include('layouts.partial.msg')
    <a href="{{route('admin.slider.create')}}" class="btn btn-primary">Add New</a>
    <div class="card my-4">
        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
            <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                <h6 class="text-white text-capitalize ps-3">Slider table</h6>
            </div>
        </div>
        <div class="card-body px-0 pb-2">
            <div class="table-responsive p-0">

                <table class="table align-items-center mb-0">
                    <thead>
                        <tr>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">SL</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Name</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Description</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Image</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Status</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Action</th>
                            <th class="text-secondary opacity-7"></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($sliders as $key=>$slider)
                        <tr>
                            <td>
                                <div class="d-flex px-2 py-1">
                                    <div class="d-flex flex-column justify-content-center">
                                        <h6 class="mb-0 text-sm"> {{$key+1}} </h6>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="d-flex px-2 py-1">
                                    <div class="d-flex flex-column justify-content-center">
                                        <h6 class="mb-0 text-sm"> {{$slider->name}} </h6>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <p class="text-xs font-weight-bold mb-0">{{$slider->description}}</p>
                            </td>
                            <td>
                                <img class="img-thumbnail" src="{{url('uploads/slider/'. $slider->image)}}" alt="image" style="height: 70px; width:90px;">
                            </td>

                            <td>
                                @if($slider->status == 0)
                                <span class="badge badge-sm bg-gradient-danger">Inactive</span>
                                @else
                                <span class="badge badge-sm bg-gradient-success">Active</span>
                                @endif
                            </td>

                            <td>
                                @if($slider->status == 0)
                                <a href="{{ route('admin.slider.show',$slider->id) }}" class="btn btn-info btn-sm mt-3" style="background:#1abc9c;">show</a> 
                                @else
                                <a href="{{ route('admin.slider.show',$slider->id) }}" class="btn-sm mt-3 btn btn-danger" style="background:#e67e22;">hide</a>
                                @endif
                                <a href="{{ route('admin.slider.edit',$slider->id) }}" class="btn btn-info btn-sm mt-3">Edit</a>
                                <form id="delete-form-{{ $slider->id }}" action="{{ route('admin.slider.destroy',$slider->id) }}" style="display: none;" method="POST">
                                    @csrf
                                    @method('DELETE')
                                </form>
                                <button type="button" class="btn btn-danger btn-sm mt-3" onclick="if(confirm('Are you sure? You want to delete this?')){
                                                    event.preventDefault();
                                                    document.getElementById('delete-form-{{ $slider->id }}').submit();
                                                }else {
                                                    event.preventDefault();
                                                        }">Delete</button>
                            </td>
                        </tr>

                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



@endsection

@push('js')

@endpush