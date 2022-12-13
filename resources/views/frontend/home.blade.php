@extends('frontend.layouts.app')

@section('title','home')

@push('css')
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/UI-darkness/jquery-ui.css">
@endpush
@section('content')
<div class="hero-wrap" style="background: #2980b9;">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">

        </div>
    </div>
</div>
<br>
<br>
<section class="ftco-booking">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">

                <form action="{{route('search')}}" method="get" class="booking-form">
                    <div class="row">

                        <div class="col-md-3 d-flex">
                            <div class="form-group p-4 align-self-stretch d-flex align-items-end" style="border-radius: 5px;">
                                <div class="wrap">
                                    <label for="#">Check-in Date</label>
                                    <input type="text" id="checkin" class="form-control" placeholder="Check-in date">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="form-group p-4 align-self-stretch d-flex align-items-end" style="border-radius: 5px;">
                                <div class="wrap">
                                    <label for="#">Check-out Date</label>
                                    <input type="text" class="form-control" id="checkout" placeholder="Check-out date">
                                </div>
                            </div>
                        </div>

                        <div class="col-md d-flex">
                            <div class="form-group p-4 align-self-stretch d-flex align-items-end" style="border-radius: 5px;">
                                <div class="wrap">
                                    <label for="#">Category</label>
                                    <select class="form-control" name="category" id="">
                                        @foreach($categories as $category)
                                        <option value="{{$category->name}}">{{$category->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md d-flex">
                            <div class="form-group p-4 align-self-stretch d-flex align-items-end" style="border-radius: 5px;">
                                <div class="wrap">
                                    <label for="#">Room</label>
                                    <select class="form-control" name="bed" id="">
                                        <option value="single">single</option>
                                        <option value="twin">twin</option>
                                        <option value="triple">triple</option>
                                        <option value="quad">quad</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md d-flex">
                            <div class="form-group d-flex align-self-stretch">
                                <input type="submit" value="Check Availability" class="btn btn-primary py-3 px-4 align-self-stretch">
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <br><br>
    <hr>
    <div class="my-3"></div>
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-pause="false">
        <ol class="carousel-indicators">
            @foreach($sliders as $key=> $slider)
            <li data-target="#carouselExampleIndicators" class="{{$key == '0' ? 'active' : ''}}"></li>
            @endforeach
        </ol>
        <div class="carousel-inner">
            @foreach($sliders as $key=> $slider)
            <div class="carousel-item {{$key == '0' ? 'active' : ''}}">
                <img class="d-block w-100" src="{{url('uploads/slider/'.$slider->image)}}" alt="First slide" height="600">
                <div class="carousel-caption d-none d-md-block">
                    <div class="bg bg-dark d-block" style="opacity: 75%; border-radius:5px;">
                        <div>
                            <h1 class="text-light">{{$slider->name}}</h2>
                            <p>{{$slider->description}}</p>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

</section>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <h2 class="mb-4">Room Categories</h2>
            </div>
        </div>
        <div class="row">
            @foreach($categories as $category)
            <div class="col-sm col-md-6 col-lg-4 ftco-animate">
                <div class="room">
                    <a href="{{route('categoryrooms', $category->slug)}}">
                        <img src="{{asset('uploads/category/'. $category->image)}}" class="img d-flex justify-content-center align-items-center" alt="image">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-search2"></span>
                        </div>
                    </a>
                    <div class="text p-3 text-center">
                        <h3 class="mb-3"><a href="{{route('categoryrooms', $category->slug)}}">{{$category->name}}</a></h3>
                        <hr>
                        <p class="pt-1"><a href="{{route('categoryrooms', $category->slug)}}" class="btn-custom">View all <span class="icon-long-arrow-right"></span></a></p>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
@endsection

@push('js')
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
    $(document).ready(function() {
        $("#checkin").datepicker({
            showAnim: 'drop',
            numberOfMonth: 1,
            minDate: 0,
            dateFormat: 'mm/dd/yy',
            onClose: function(selectedDate) {
                var dt = new Date(selectedDate);
                dt.setDate(dt.getDate() + 1)
                $("#checkout").datepicker("option", "minDate", dt);
            }
        });
        $("#checkout").datepicker({
            showAnim: 'drop',
            numberOfMonth: 1,
            minDate: 0,
            dateFormat: 'mm/dd/yy',
            onClose: function(selectedDate) {
                var dt = new Date(selectedDate);
                dt.setDate(dt.getDate() - 1)
                $("#checkin").datepicker("option", "maxDate", dt);
            }
        });
    });
</script>

@endpush