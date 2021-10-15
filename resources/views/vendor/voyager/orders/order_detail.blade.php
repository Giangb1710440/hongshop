@extends('voyager::master')

@section('head')
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="{{ asset('public/css/table.css') }}">
    <script src="https://unpkg.com/sweetalert2@7.18.0/dist/sweetalert2.all.js"></script>
    <script src="https://unpkg.com/sweetalert2@7.18.0/dist/sweetalert2.all.js"></script>
@endsection

@section('page_title', 'Chi Tiết Đơn Hàng')

@section('page_header')

@stop

@section('content')
    <div class="container">
        <div class="row">
            <div class="card">
                <div class="card-header">
                    <div class="img">
                        <span class="float-right">
                            <strong>Mã hóa đơn: DH-</strong>{{ $order->id }}
                            <br>
                            <strong>Ngày tạo:</strong> {{ $order->created_at }}
                        </span>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-sm-6">
                            <h6 class="mb-3">Từ:</h6>
                            <div>
                                <strong>HongShop</strong>
                            </div>
                            <div>Địa chỉ: An Cư, Ninh Kiều, Cần Thơ</div>
                            <div>Email: buidan@gmail.com </div>
                            <div>Phone: 0657 385 234 </div>
                        </div>

                        <div class="col-sm-6">
                            <h6 class="mb-3">Đến:</h6>
                            <div>
                                <strong>
                                    @if(isset($customer->name))
                                        <div>{{ $customer->name }}</div>
                                    @endisset
                                    @if(isset($customer->fullname))
                                        <div>{{ $customer->fullname }}</div>
                                    @endisset
                                </strong>
                            </div>
                            <div>Email: {{ $customer->email }} </div>
                            <div>Số điện thoại: {{ $customer->phone }} </div>
                            <div>Địa chỉ: {{ $customer->address }}</div>
                        </div>
                    </div>

                    <div class="table-responsive-sm">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Đơn vị tính</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Tổng tiền</th>
                            </tr>
                            </thead>
                            <tbody>
                                @foreach($orderDetail as $item)
                                    <tr>
                                        <td data-label="Tên sản phẩm">
                                            @php
                                                $product = DB::table('products')->where('id', $item->product_id)->first();
                                                $productDetail = DB::table('detail_products')->where('product_id', $product->id)->first();
                                            @endphp
                                            <b>{{ $product->name_product }}</b>
                                        </td>

                                        <td data-label="Giá">
                                            {{ number_format($productDetail->price) }} VND
                                        </td>

                                        <td data-label="Đơn vị tính">
                                            VNĐ
                                        </td>

                                        <td data-label="Số lượng">
                                            {{ $item->quantity }}
                                        </td>

                                        <td data-label="Tổng tiền">
                                            {{ number_format($item->price) }} VND
                                        </td>

                                    </tr>
                                @endforeach

                            </tbody>

                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-sm-8">

                        </div>

                        <div class="col-lg-4 col-sm-4 ml-auto">
                            <table class="table table-clear">
                                <tbody>
                                <tr>
                                    <td class="left">
                                        <strong>Thành tiền</strong>
                                    </td>
                                    <td class="right">
                                        <strong>{{ number_format($total) }} VND</strong>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <style>
                                @media print {
                                    .print{  display:none; }
                                }
                            </style>
                            <a style="float: right" class="btn btn-success print" onClick="window.print()">In</a>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>

    <script>
        var msg = '{{Session::get('addProductSuccess')}}';
        var exist = '{{Session::has('addProductSuccess')}}';
        if(exist){
            swal({
                title: "Đã thêm sản phẩm thành công",
                text: "",
                type: "success",
                timer: 1200,
                showConfirmButton: false,
                position: 'top-end',
            });
        }

    </script>
@stop
