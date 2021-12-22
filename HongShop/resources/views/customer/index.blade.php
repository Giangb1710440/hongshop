@extends('layout.master')
@section('content')

<section class="hero-section">
    <div class="hero-items owl-carousel">
        <div class="single-hero-items set-bg" data-setbg="{{ asset('public/img/hhhh.png') }}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                    </div>
                </div>
            </div>
        </div>
        <div class="single-hero-items set-bg" data-setbg="{{ asset('public/img/banner2.jpg') }}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Banner Section Begin -->
<div class="banner-section spad">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6">
                <div class="single-banner">
                    <img src="{{ asset('public/img/giay nam.jpg') }}" alt="">
                    <div class="inner-text">
                        <h4>Giày Nam</h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="single-banner">
                    <img src="{{ asset('public/img/giay nu.jpg') }}" alt="">
                    <div class="inner-text">
                        <h4>Giày Nữ</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner Section End -->

<!-- Women Banner Section Begin -->
<section class="women-banner spad">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="filter-control">
                    <ul>
                        <style>
                            li a:hover{
                                color: black;
                            }
                        </style>
                        @foreach($loai_sp as $loai)
                            <li class="">
                                <a href="{{ route('loaiSanPham', $loai->id) }}">{{ $loai->name }}</a>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>

        <div class="row">
            @foreach($sps as $sp)
                <div class="col-md-3 text-center">
                    <div class="card">
                        @php($chitiet = DB::table('detail_products')->where('product_id', $sp->id)->get())
                        @foreach($chitiet as $ct)

                                @foreach((array)json_decode($ct->image, true) as $image)
                                    <a href="{{ url('/xem-san-pham', $sp->id) }}">
                                        <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">
                                    </a>
                                    @break
                                @endforeach

                            <div class="card-body">
                                <a href="{{ url('/xem-san-pham', $sp->id) }}">
                                    <span class="card-title" style="font-size: 13px">{{ $sp->name_product }}</span>
                                </a>
                                <p class="card-text" style="font-size: 13px">{{ number_format($ct->price) }} đ</p>
                                <a href="{{ route('themGioHang', $sp->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>
                            </div>
                        @endforeach
                    </div>
                </div>
            @endforeach

        </div>
    </div>
</section>
<!-- Women Banner Section End -->

<!-- Deal Of The Week Section End -->

<!-- Man Banner Section Begin -->
<section class="man-banner spad mt-0">
    <div class="container-fluid" style="height: 50%">
        <div class="row">
            <div class="col-lg-12">
                <div class="filter-control">
                    <ul>
                        <style>
                            li a:hover{
                                color: black;
                            }
                        </style>
                        @foreach($loai_nam as $loai)
                            <li class="">
                                <a href="{{ route('loaiSanPham', $loai->id) }}">{{ $loai->name }}</a>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>

        <div class="row">

            @foreach($sp1 as $sp1)
                <div class="col-md-3 text-center">
                    <div class="card">
                        @php($chitiet = DB::table('detail_products')->where('product_id', $sp1->id)->get())
                        @foreach($chitiet as $ct)

                            @foreach((array)json_decode($ct->image, true) as $image)
                                <a href="{{ url('/xem-san-pham', $sp1->id) }}">
                                    <img style="width: 200px; height: 200px;" class="card-img-top"
                                         src="{{ voyager::image($image) }}" alt="">
                                </a>
                                @break
                            @endforeach

                            <div class="card-body">
                                <a href="{{ url('/xem-san-pham', $sp1->id) }}">
                                    <span class="card-title" style="font-size: 13px">{{ $sp1->name_product }}</span>
                                </a>
                                <p class="card-text" style="font-size: 13px">{{ number_format($ct->price) }} đ</p>
                                <a href="{{ route('themGioHang', $sp1->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>
                            </div>
                        @endforeach
                    </div>
                </div>
            @endforeach

        </div>
    </div>
</section>
<!-- Man Banner Section End -->

<script>
    var msg = '{{Session::get('add_cart_success')}}';
    var exist = '{{Session::has('add_cart_success')}}';
    if(exist){
        swal({
            title: "Đã thêm vào giỏ hàng",
            text: "",
            type: "success",
            timer: 1200,
            showConfirmButton: false,
            position: 'top-end',
        });
    }
</script>
@endsection



