@extends('layout.master')
@section('title',"Trang chủ")
@section('content')

<section class="hero-section">
    <div class="hero-items owl-carousel">
        <div class="single-hero-items set-bg" data-setbg="{{ asset('public/img/shop.png') }}">
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
                    <img src="{{ asset('public/img/bia1.png') }}" alt="">
                    <div class="inner-text">
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="single-banner">
                    <img src="{{ asset('public/img/bia2.png') }}" alt="">
                    <div class="inner-text">
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
                <div class="product__details__tab">
                    <div class="row">
                        <div class="col-lg-3"></div>
                        <div style="margin-left: 90px" class="col-lg-6">
                            <ul style="width: 100%;display: flex;align-items: center;justify-content: center;" class="nav nav-tabs text-center" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                       aria-selected="false">Dép Nữ</a>
                                </li>
                                @foreach($loai_sp as $loai_sps)
                                    @if($loai_sps->id == 1)
                                        @continue
                                    @else
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#tabs-{{$loai_sps->id}}" role="tab"
                                               aria-selected="false">{{$loai_sps->name}} <span></span></a>
                                        </li>
                                    @endif
                                @endforeach
                            </ul>
                        </div>
                        <div class="col-lg-3"></div>
                    </div>
                    <br>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="row">
                                @php($product1 = DB::table('products')->where('category_id',1)->get())
                                @foreach($product1 as $product1s)
                                    <div class="col-md-3 text-center">
                                        <div class="card">
                                            @php($chitiet1 = DB::table('detail_products')->where('product_id', $product1s->id)->get())
                                            @foreach($chitiet1 as $ct1)

                                                @foreach((array)json_decode($ct1->image, true) as $image)
                                                    <a href="{{ url('/xem-san-pham', $product1s->id) }}">
                                                        <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">
                                                    </a>
                                                    @break
                                                @endforeach

                                                <div class="card-body">
                                                    <a href="{{ url('/xem-san-pham', $product1s->id) }}">
                                                        <span class="card-title" style="font-size: 13px">{{ $product1s->name_product }}</span>
                                                    </a>
                                                    <p class="card-text" style="font-size: 13px">{{ number_format($ct1->price) }} đ</p>
                                                    <a href="{{ route('themGioHang', $product1s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endforeach

                            </div>
                        </div>

                        <div class="tab-pane " id="tabs-2" role="tabpanel">
                            <div class="row">
                                @php($product2 = DB::table('products')->where('category_id',2)->get())
                                @foreach($product2 as $product2s)
                                    <div class="col-md-3">
                                        <div class="card">
                                            @php($chitiet2 = DB::table('detail_products')->where('product_id', $product2s->id)->get())
                                            @foreach($chitiet2 as $ct2)

                                                @foreach((array)json_decode($ct2->image, true) as $image)
                                                    <a href="{{ url('/xem-san-pham', $product2s->id) }}">
                                                        <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">
                                                    </a>
                                                    @break
                                                @endforeach

                                                <div class="card-body">
                                                    <a href="{{ url('/xem-san-pham', $product2s->id) }}">
                                                        <span class="card-title" style="font-size: 13px">{{ $product2s->name_product }}</span>
                                                    </a>
                                                    <p class="card-text" style="font-size: 13px">{{ number_format($ct2->price) }} đ</p>
                                                    <a href="{{ route('themGioHang', $product2s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="tab-pane " id="tabs-3" role="tabpanel">
                            <div class="row">
                                @php($product3 = DB::table('products')->where('category_id',3)->get())
                                @foreach($product3 as $product3s)
                                    <div class="col-md-3">
                                        <div class="card">
                                            @php($chitiet3 = DB::table('detail_products')->where('product_id', $product3s->id)->get())
                                            @foreach($chitiet3 as $ct3)

                                                @foreach((array)json_decode($ct3->image, true) as $image)
                                                    <a href="{{ url('/xem-san-pham', $product3s->id) }}">
                                                        <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">
                                                    </a>
                                                    @break
                                                @endforeach

                                                <div class="card-body">
                                                    <a href="{{ url('/xem-san-pham', $product3s->id) }}">
                                                        <span class="card-title" style="font-size: 13px">{{ $product3s->name_product }}</span>
                                                    </a>
                                                    <p class="card-text" style="font-size: 13px">{{ number_format($ct3->price) }} đ</p>
                                                    <a href="{{ route('themGioHang', $product3s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="tab-pane " id="tabs-4" role="tabpanel">
                            <div class="row">
                                @php($product4 = DB::table('products')->where('category_id',4)->get())
                                @foreach($product4 as $product4s)
                                    <div class="col-md-3">
                                        <div class="card">
                                            @php($chitiet4 = DB::table('detail_products')->where('product_id', $product4s->id)->get())
                                            @foreach($chitiet4 as $ct4)

                                                @foreach((array)json_decode($ct4->image, true) as $image)
                                                    <a href="{{ url('/xem-san-pham', $product4s->id) }}">
                                                        <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">
                                                    </a>
                                                    @break
                                                @endforeach

                                                <div class="card-body">
                                                    <a href="{{ url('/xem-san-pham', $product4s->id) }}">
                                                        <span class="card-title" style="font-size: 13px">{{ $product4s->name_product }}</span>
                                                    </a>
                                                    <p class="card-text" style="font-size: 13px">{{ number_format($ct4->price) }} đ</p>
                                                    <a href="{{ route('themGioHang', $product4s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endforeach

                            </div>
                        </div>
                        <div class="tab-pane " id="tabs-5" role="tabpanel">
                            <div class="row">
                                @php($product5 = DB::table('products')->where('category_id',4)->get())
                                @foreach($product5 as $product5s)
                                    <div class="col-md-3">
                                        <div class="card">
                                            @php($chitiet5 = DB::table('detail_products')->where('product_id', $product4s->id)->get())
                                            @foreach($chitiet5 as $ct5)

                                                @foreach((array)json_decode($ct5->image, true) as $image)
                                                    <a href="{{ url('/xem-san-pham', $product5s->id) }}">
                                                        <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">
                                                    </a>
                                                    @break
                                                @endforeach

                                                <div class="card-body">
                                                    <a href="{{ url('/xem-san-pham', $product5s->id) }}">
                                                        <span class="card-title" style="font-size: 13px">{{ $product5s->name_product }}</span>
                                                    </a>
                                                    <p class="card-text" style="font-size: 13px">{{ number_format($ct5->price) }} đ</p>
                                                    <a href="{{ route('themGioHang', $product5s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endforeach

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Women Banner Section End -->

<!-- Deal Of The Week Section End -->
<section class="man-banner spad mt-0">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <div class="row">
                        <div class="col-lg-3"></div>
                        <div style="margin-left: 90px" class="col-lg-6">
                            <ul style="width: 100%;display: flex;align-items: center;justify-content: center;" class="nav nav-tabs text-center" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-6" role="tab"
                                       aria-selected="false">Giày Thể Thao Nam</a>
                                </li>
                                @foreach($loai_nam as $loai_nams)
                                    @if($loai_nams->id == 6)
                                        @continue
                                    @else
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#tabs-{{$loai_nams->id}}" role="tab"
                                               aria-selected="false">{{$loai_nams->name}} <span></span></a>
                                        </li>
                                    @endif
                                @endforeach
                            </ul>
                        </div>
                        <div class="col-lg-3"></div>
                    </div>
                    <br>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-6" role="tabpanel">
                            <div class="row">
                                @php($product6 = DB::table('products')->where('category_id',6)->get())
                                @foreach($product6 as $product6s)
                                    <div class="col-md-3 text-center">
                                        <div class="card">
                                            @php($chitiet6 = DB::table('detail_products')->where('product_id', $product6s->id)->get())
                                            @foreach($chitiet6 as $ct6)

                                                @foreach((array)json_decode($ct6->image, true) as $image)
                                                    <a href="{{ url('/xem-san-pham', $product6s->id) }}">
                                                        <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">
                                                    </a>
                                                    @break
                                                @endforeach

                                                <div class="card-body">
                                                    <a href="{{ url('/xem-san-pham', $product6s->id) }}">
                                                        <span class="card-title" style="font-size: 13px">{{ $product6s->name_product }}</span>
                                                    </a>
                                                    <p class="card-text" style="font-size: 13px">{{ number_format($ct6->price) }} đ</p>
                                                    <a href="{{ route('themGioHang', $product6s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endforeach

                            </div>
                        </div>

                        <div class="tab-pane " id="tabs-7" role="tabpanel">
                            <div class="row">
                                @php($product7 = DB::table('products')->where('category_id',7)->get())
                                @foreach($product7 as $product7s)
                                    <div class="col-md-3">
                                        <div class="card">
                                            @php($chitiet7 = DB::table('detail_products')->where('product_id', $product7s->id)->get())
                                            @foreach($chitiet7 as $ct7)
                                                @foreach((array)json_decode($ct7->image, true) as $image)
                                                    <a href="{{ url('/xem-san-pham', $product7s->id) }}">
                                                        <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">
                                                    </a>
                                                    @break
                                                @endforeach
                                                <div class="card-body">
                                                    <a href="{{ url('/xem-san-pham', $product7s->id) }}">
                                                        <span class="card-title" style="font-size: 13px">{{ $product7s->name_product }}</span>
                                                    </a>
                                                    <p class="card-text" style="font-size: 13px">{{ number_format($ct7->price) }} đ</p>
                                                    <a href="{{ route('themGioHang', $product7s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="tab-pane " id="tabs-8" role="tabpanel">
                            <div class="row">
                                @php($product8 = DB::table('products')->where('category_id',8)->get())
                                @foreach($product8 as $product8s)
                                    <div class="col-md-3">
                                        <div class="card">
                                            @php($chitiet8 = DB::table('detail_products')->where('product_id', $product8s->id)->get())
                                            @foreach($chitiet8 as $ct8)

                                                @foreach((array)json_decode($ct8->image, true) as $image)
                                                    <a href="{{ url('/xem-san-pham', $product8s->id) }}">
                                                        <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">
                                                    </a>
                                                    @break
                                                @endforeach

                                                <div class="card-body">
                                                    <a href="{{ url('/xem-san-pham', $product8s->id) }}">
                                                        <span class="card-title" style="font-size: 13px">{{ $product8s->name_product }}</span>
                                                    </a>
                                                    <p class="card-text" style="font-size: 13px">{{ number_format($ct8->price) }} đ</p>
                                                    <a href="{{ route('themGioHang', $product8s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="tab-pane " id="tabs-9" role="tabpanel">
                            <div class="row">
                                @php($product9 = DB::table('products')->where('category_id',9)->get())
                                @foreach($product9 as $product9s)
                                    <div class="col-md-3">
                                        <div class="card">
                                            @php($chitiet9 = DB::table('detail_products')->where('product_id', $product9s->id)->get())
                                            @foreach($chitiet9 as $ct9)

                                                @foreach((array)json_decode($ct9->image, true) as $image)
                                                    <a href="{{ url('/xem-san-pham', $product9s->id) }}">
                                                        <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">
                                                    </a>
                                                    @break
                                                @endforeach

                                                <div class="card-body">
                                                    <a href="{{ url('/xem-san-pham', $product9s->id) }}">
                                                        <span class="card-title" style="font-size: 13px">{{ $product9s->name_product }}</span>
                                                    </a>
                                                    <p class="card-text" style="font-size: 13px">{{ number_format($ct9->price) }} đ</p>
                                                    <a href="{{ route('themGioHang', $product9s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endforeach

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Man Banner Section Begin -->
{{--<section class="man-banner spad mt-0">--}}
{{--    <div class="container-fluid" style="height: 50%">--}}
{{--        <div class="row">--}}
{{--            <div class="col-lg-3"></div>--}}
{{--            <div style="margin-left: 90px" class="col-lg-6">--}}
{{--                <ul style="width: 100%;display: flex;align-items: center;justify-content: center;" class="nav nav-tabs text-center" role="tablist">--}}
{{--                    <li class="nav-item">--}}
{{--                        <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"--}}
{{--                           aria-selected="false">Dép Nữ</a>--}}
{{--                    </li>--}}
{{--                    @foreach($loai_sp as $loai_sps)--}}
{{--                        @if($loai_sps->id == 1)--}}
{{--                            @continue--}}
{{--                        @else--}}
{{--                            <li class="nav-item">--}}
{{--                                <a class="nav-link" data-toggle="tab" href="#tabs-{{$loai_sps->id}}" role="tab"--}}
{{--                                   aria-selected="false">{{$loai_sps->name}} <span></span></a>--}}
{{--                            </li>--}}
{{--                        @endif--}}
{{--                    @endforeach--}}
{{--                </ul>--}}
{{--            </div>--}}
{{--            <div class="col-lg-3"></div>--}}
{{--        </div>--}}

{{--        <br>--}}
{{--        <div class="tab-content">--}}
{{--            <div class="tab-pane active" id="tabs-1" role="tabpanel">--}}
{{--                <div class="row">--}}
{{--                    @php($product1 = DB::table('products')->where('category_id',1)->get())--}}
{{--                    @foreach($product1 as $product1s)--}}
{{--                        <div class="col-md-3 text-center">--}}
{{--                            <div class="card">--}}
{{--                                @php($chitiet1 = DB::table('detail_products')->where('product_id', $product1s->id)->get())--}}
{{--                                @foreach($chitiet1 as $ct1)--}}

{{--                                    @foreach((array)json_decode($ct1->image, true) as $image)--}}
{{--                                        <a href="{{ url('/xem-san-pham', $product1s->id) }}">--}}
{{--                                            <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">--}}
{{--                                        </a>--}}
{{--                                        @break--}}
{{--                                    @endforeach--}}

{{--                                    <div class="card-body">--}}
{{--                                        <a href="{{ url('/xem-san-pham', $product1s->id) }}">--}}
{{--                                            <span class="card-title" style="font-size: 13px">{{ $product1s->name_product }}</span>--}}
{{--                                        </a>--}}
{{--                                        <p class="card-text" style="font-size: 13px">{{ number_format($ct1->price) }} đ</p>--}}
{{--                                        <a href="{{ route('themGioHang', $product1s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>--}}
{{--                                    </div>--}}
{{--                                @endforeach--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    @endforeach--}}

{{--                </div>--}}
{{--            </div>--}}

{{--            <div class="tab-pane " id="tabs-2" role="tabpanel">--}}
{{--                <div class="row">--}}
{{--                    @php($product2 = DB::table('products')->where('category_id',2)->get())--}}
{{--                    @foreach($product2 as $product2s)--}}
{{--                        <div class="col-md-3">--}}
{{--                            <div class="card">--}}
{{--                                @php($chitiet2 = DB::table('detail_products')->where('product_id', $product2s->id)->get())--}}
{{--                                @foreach($chitiet2 as $ct2)--}}

{{--                                    @foreach((array)json_decode($ct2->image, true) as $image)--}}
{{--                                        <a href="{{ url('/xem-san-pham', $product2s->id) }}">--}}
{{--                                            <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">--}}
{{--                                        </a>--}}
{{--                                        @break--}}
{{--                                    @endforeach--}}

{{--                                    <div class="card-body">--}}
{{--                                        <a href="{{ url('/xem-san-pham', $product2s->id) }}">--}}
{{--                                            <span class="card-title" style="font-size: 13px">{{ $product2s->name_product }}</span>--}}
{{--                                        </a>--}}
{{--                                        <p class="card-text" style="font-size: 13px">{{ number_format($ct2->price) }} đ</p>--}}
{{--                                        <a href="{{ route('themGioHang', $product2s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>--}}
{{--                                    </div>--}}
{{--                                @endforeach--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    @endforeach--}}
{{--                </div>--}}
{{--            </div>--}}
{{--            <div class="tab-pane " id="tabs-3" role="tabpanel">--}}
{{--                <div class="row">--}}
{{--                    @php($product3 = DB::table('products')->where('category_id',3)->get())--}}
{{--                    @foreach($product3 as $product3s)--}}
{{--                        <div class="col-md-3">--}}
{{--                            <div class="card">--}}
{{--                                @php($chitiet3 = DB::table('detail_products')->where('product_id', $product3s->id)->get())--}}
{{--                                @foreach($chitiet3 as $ct3)--}}

{{--                                    @foreach((array)json_decode($ct3->image, true) as $image)--}}
{{--                                        <a href="{{ url('/xem-san-pham', $product3s->id) }}">--}}
{{--                                            <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">--}}
{{--                                        </a>--}}
{{--                                        @break--}}
{{--                                    @endforeach--}}

{{--                                    <div class="card-body">--}}
{{--                                        <a href="{{ url('/xem-san-pham', $product3s->id) }}">--}}
{{--                                            <span class="card-title" style="font-size: 13px">{{ $product3s->name_product }}</span>--}}
{{--                                        </a>--}}
{{--                                        <p class="card-text" style="font-size: 13px">{{ number_format($ct3->price) }} đ</p>--}}
{{--                                        <a href="{{ route('themGioHang', $product3s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>--}}
{{--                                    </div>--}}
{{--                                @endforeach--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    @endforeach--}}
{{--                </div>--}}
{{--            </div>--}}
{{--            <div class="tab-pane " id="tabs-4" role="tabpanel">--}}
{{--                <div class="row">--}}
{{--                    @php($product4 = DB::table('products')->where('category_id',4)->get())--}}
{{--                    @foreach($product4 as $product4s)--}}
{{--                        <div class="col-md-3">--}}
{{--                            <div class="card">--}}
{{--                                @php($chitiet4 = DB::table('detail_products')->where('product_id', $product4s->id)->get())--}}
{{--                                @foreach($chitiet4 as $ct4)--}}

{{--                                    @foreach((array)json_decode($ct4->image, true) as $image)--}}
{{--                                        <a href="{{ url('/xem-san-pham', $product4s->id) }}">--}}
{{--                                            <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">--}}
{{--                                        </a>--}}
{{--                                        @break--}}
{{--                                    @endforeach--}}

{{--                                    <div class="card-body">--}}
{{--                                        <a href="{{ url('/xem-san-pham', $product4s->id) }}">--}}
{{--                                            <span class="card-title" style="font-size: 13px">{{ $product4s->name_product }}</span>--}}
{{--                                        </a>--}}
{{--                                        <p class="card-text" style="font-size: 13px">{{ number_format($ct4->price) }} đ</p>--}}
{{--                                        <a href="{{ route('themGioHang', $product4s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>--}}
{{--                                    </div>--}}
{{--                                @endforeach--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    @endforeach--}}

{{--                </div>--}}
{{--            </div>--}}
{{--            <div class="tab-pane " id="tabs-5" role="tabpanel">--}}
{{--                <div class="row">--}}
{{--                    @php($product5 = DB::table('products')->where('category_id',4)->get())--}}
{{--                    @foreach($product5 as $product5s)--}}
{{--                        <div class="col-md-3">--}}
{{--                            <div class="card">--}}
{{--                                @php($chitiet5 = DB::table('detail_products')->where('product_id', $product4s->id)->get())--}}
{{--                                @foreach($chitiet5 as $ct5)--}}

{{--                                    @foreach((array)json_decode($ct5->image, true) as $image)--}}
{{--                                        <a href="{{ url('/xem-san-pham', $product5s->id) }}">--}}
{{--                                            <img style="width: 200px; height: 200px" class="card-img-top" src="{{ voyager::image($image) }}" alt="">--}}
{{--                                        </a>--}}
{{--                                        @break--}}
{{--                                    @endforeach--}}

{{--                                    <div class="card-body">--}}
{{--                                        <a href="{{ url('/xem-san-pham', $product5s->id) }}">--}}
{{--                                            <span class="card-title" style="font-size: 13px">{{ $product5s->name_product }}</span>--}}
{{--                                        </a>--}}
{{--                                        <p class="card-text" style="font-size: 13px">{{ number_format($ct5->price) }} đ</p>--}}
{{--                                        <a href="{{ route('themGioHang', $product5s->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>--}}
{{--                                    </div>--}}
{{--                                @endforeach--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    @endforeach--}}

{{--                </div>--}}
{{--            </div>--}}
{{--        </div>--}}
{{--    </div>--}}
{{--</section>--}}
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
<script>
    var msg = '{{Session::get('success')}}';
    var exist = '{{Session::has('success')}}';
    if(exist){
        swal({
            title: "Đã thanh toán",
            text: "",
            type: "success",
            timer: 1200,
            showConfirmButton: false,
            position: 'top-end',
        });
    }
</script>
<script>
    var msg = '{{Session::get('order_success')}}';
    var exist = '{{Session::has('order_success')}}';
    if(exist){
        swal({
            title: "Đặt hàng thành công",
            text: "",
            type: "success",
            timer: 1200,
            showConfirmButton: false,
            position: 'top-end',
        });
    }
</script>

@endsection



