<footer class="ftco-footer ftco-bg-dark ftco-section">
    <div class="container">
        <div class="row mb-5">
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Deluxe Hotel</h2>
                    <p>Well-appointed Deluxe rooms offer excellent amenities including a fully equipped kitchen, ensuring that you have a comfortable stay in Dhaka.</p>
                    <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                        <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4 ml-md-5">
                    <h2 class="ftco-heading-2">Categories</h2>
                    <ul class="list-unstyled">
                        @foreach($randomcategories->random(4) as $randomcategory)
                        <li><a href="#" class="py-2 d-block">{{$randomcategory->name}}</a></li>
                        @endforeach
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Rooms</h2>
                    <ul class="list-unstyled">
                        @foreach($rooms->take(4) as $room)
                        <li><a href="#" class="py-2 d-block">{{$room->name}}</a></li>
                        @endforeach
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Have any Queries?</h2>
                    <div class="block-23 mb-3">
                        <ul>
                            <li><span class="icon icon-map-marker"></span><span class="text">Sector 10, Road 12/A, IUBAT, Uttara, Dhaka</span></li>
                            <li><a href="#"><span class="icon icon-phone"></span><span class="text">+880 1523 125 684</span></a></li>
                            <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@iubat.com</span></a></li>
                            <li><a href="#"><span class="icon icon-envelope"></span><span class="text">helpline@iubat.com</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">

        </div>
    </div>
</footer>