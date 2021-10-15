@extends('layout.master')
@foreach($cate as $cates)
    @if($cates->order == 1)
        @section('title', 'Giày nữ')
    @else
        @section('title', 'Giày nam')
    @endif
    @break
@endforeach
@section('content')
    <section class="women-banner spad">
        <div class="container-fluid">
            <style>
                .responsive{
                    width: 140px;
                    height: 140px;
                    border-radius: 50%;
                    border: 1px solid #a0aec0;
                }
                .card-img-user{
                    padding-right: 1px;
                }
                .card-information{
                    padding-left: 1px;
                }

                .imagePreview {
                    margin: auto;
                    width: 100px;
                    height: 100px;
                    border-radius: 50%;
                    display: none;
                    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
                }

                .button-wrapper {
                    position: relative;
                    width: 100px;
                    text-align: center;
                    font-weight: bold;
                }

                .button-wrapper span.label {
                    position: relative;
                    z-index: 0;
                    display: inline-block;
                    width: 100%;
                    background: #00bfff;
                    cursor: pointer;
                    color: #fff;
                    padding: 10px 0;
                    text-transform:uppercase;
                    font-size:12px;
                    border-radius: 5px;
                    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
                }
                #upload {
                    display: inline-block;
                    position: absolute;
                    z-index: 1;
                    width: 100%;
                    height: 50px;
                    top: 0;
                    left: 0;
                    opacity: 0;
                    cursor: pointer;
                }
                /*Small devices (landscape phones, 576px and up)*/
                @media (max-width: 576px) {
                    .card-body .row .card-img-user{
                        text-align: center;
                    }
                    .card-body .row .card-img-user .responsive{
                        margin-bottom: 20px;
                        text-align: center;
                        width: 130px;
                        height: 130px;
                    }
                    .card-information{
                        padding-left: 5%;
                    }
                    .form-group .col-12{
                        font-size: 13px;
                        margin-bottom: 5px;
                    }
                    .form-group .col-12 input{
                        font-size: 13px;
                    }
                    .form-check-inline .form-check-label input{
                        font-size: 13px;
                    }
                }
            </style>

            <div class="card">
                <div class="card-header p-2 text-center">
                    @foreach($cate as $cates)
                        @if($cates->order == 1)
                            <h3><b>GIÀY NỮ</b></h3>
                        @else
                            <h3><b>GIÀY NAM</b></h3>
                        @endif
                        @break
                    @endforeach

                </div>
                <div class="card-body">
                    <div class="row">
                        @foreach($cate as $cates)
                            @foreach($products as $product)
                                @if($product->category_id == $cates->id)
                                    <div class="col-md-3 text-center">
                                        <div class="card">
                                            @php($chitiet = DB::table('detail_products')->where('product_id', $product->id)->get())
                                            @foreach($chitiet as $ct)

                                                @foreach((array)json_decode($ct->image, true) as $image)
                                                    <a href="{{ url('/xem-san-pham', $product->id) }}">
                                                        <img style="width: 200px; height: 200px;" class="card-img-top"
                                                             src="{{ voyager::image($image) }}" alt="">
                                                    </a>
                                                    @break
                                                @endforeach

                                                <div class="card-body">
                                                    <a href="{{ url('/xem-san-pham', $product->id) }}">
                                                        <span class="card-title" style="font-size: 13px">{{ $product->name_product }}</span>
                                                    </a>
                                                    <p class="card-text" style="font-size: 13px">{{ number_format($ct->price) }} đ</p>
                                                    <a href="{{ route('themGioHang', $product->id) }}" class="btn btn-primary"> Thêm vào giỏ hàng</a>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endif
                            @endforeach
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

    </section>
@endsection
