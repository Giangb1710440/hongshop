@extends('voyager::master')

@section('head')

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://unpkg.com/sweetalert2@7.18.0/dist/sweetalert2.all.js"></script>
    <script src="https://unpkg.com/sweetalert2@7.18.0/dist/sweetalert2.all.js"></script>
@endsection

@section('page_title', 'Doanh thu')


@section('page_header')
    <style>
        h2{
            text-align: center;
        }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản Lý Doanh Thu</h2>
            </div>
        </div>
    </div>
@stop

@section('content')
    <style type="text/css" media="screen"
    >
        table {
            padding:10px;
            width: 100%;
            table-layout:auto;
        }
        table tr {
            background-color: white;
            padding:auto;
            padding-bottom:10px;
        }
        table th,
        table td {
            padding:10px;
            border: 1px solid #ddd;
            font-size: 13px;
        }
        table th {
            font-size: 10px;
            text-transform: uppercase;
            color: black;font-weight: bold;
        }

        /* Peponsive */
        @media screen and (max-width: 600px) {
            table{
                border: 0;
                width: 100%;
            }

            table thead {
                clip: rect(0 0 0 0);
                height: 1px;
                overflow: hidden;
                padding: 0;
                position: absolute;
            }
            table tr {
                display: block;
                margin-bottom: .100em;
            }
            table td {
                display: block;
                padding:5px;
                font-size: 10px;
                text-align: right;
            }
            table td::before {
                content: attr(data-label);
                float: left;
                font-weight: bold;
                text-transform: uppercase;

            }
            table td:last-child {
                border: 1px solid #ddd;
            }
            .el-overlay-1{
                width:100%;height:auto;
            }

        }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3>Doanh thu tháng 4-2021</h3>
                <div class="table-responsive">
                    <table class="table-hover">
                        <thead>
                        <tr>
                            <th scope="col">Tổng hóa đơn</th>
                            <th scope="col">Tổng sản phẩm</th>
                            <th scope="col">Danh thu</th>
                        </tr>
                        </thead>
                        <tbody id="users-crud">
                        @php( $totalOrder = 0)
                        @php($totalProduct = 0)
                        @php($totalRevenus = 0)
                        @foreach($orders as $order)
                            @if(\Carbon\Carbon::create($order->created_at)->month == 4)
                                @php($totalOrder += 1)
                                @php($totalProduct += DB::table('order_details')->where('order_id', $order->id)->count())
                                @php($totalRevenus += $order->total_money)
                            @endif
                        @endforeach
                        <tr>

                            <td data-label="Tổng hóa đơn">
                                {{ $totalOrder }}
                            </td>

                            <td data-label="Tổng sản phẩm">
                                {{ $totalProduct }}
                            </td>

                            <td data-label="Danh thu">
                                {{ number_format($totalRevenus) }} VNĐ
                            </td>

                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <h3>Doanh thu năm 2020</h3>
                <div class="table-responsive">
                    <table class="table-hover">
                        <thead>
                        <tr>
                            <th scope="col">Tổng hóa đơn</th>
                            <th scope="col">Tổng sản phẩm</th>
                            <th scope="col">Danh thu</th>
                        </tr>
                        </thead>
                        <tbody id="users-crud">
                        @php( $totalOrder = 0)
                        @php($totalProduct = 0)
                        @php($totalRevenus = 0)
                        @php($orders = DB::table('orders')->get())
                        @foreach($orders as $order)
                            @if(\Carbon\Carbon::create($order->created_at)->year == 2020)
                                @php($totalOrder += 1)
                                @php($totalProduct += DB::table('order_details')->where('order_id', $order->id)->count())
                                @php($totalRevenus += $order->total_money)
                            @endif
                        @endforeach
                        <tr>

                            <td data-label="Tổng hóa đơn">
                                {{ $totalOrder }}
                            </td>

                            <td data-label="Tổng sản phẩm">
                                {{ $totalProduct }}
                            </td>

                            <td data-label="Danh thu">
                                {{ number_format($totalRevenus) }} VNĐ
                            </td>

                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <h3>Doanh thu hiện tại năm 2021</h3>
                <div class="table-responsive">
                    <table class="table-hover">
                        <thead>
                        <tr>
                            <th scope="col">Tổng hóa đơn</th>
                            <th scope="col">Tổng sản phẩm</th>
                            <th scope="col">Danh thu</th>
                        </tr>
                        </thead>
                        <tbody id="users-crud">
                        @php( $totalOrder = 0)
                        @php($totalProduct = 0)
                        @php($totalRevenus = 0)
                        @php($orders = DB::table('orders')->get())
                        @foreach($orders as $order)
                            @if(\Carbon\Carbon::create($order->created_at)->year == 2021)
                                @php($totalOrder += 1)
                                @php($totalProduct += DB::table('order_details')->where('order_id', $order->id)->count())
                                @php($totalRevenus += $order->total_money)
                            @endif
                        @endforeach
                        <tr>

                            <td data-label="Tổng hóa đơn">
                                {{ $totalOrder }}
                            </td>

                            <td data-label="Tổng sản phẩm">
                                {{ $totalProduct }}
                            </td>

                            <td data-label="Danh thu">
                                {{ number_format($totalRevenus) }} VNĐ
                            </td>

                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        var msg = '{{Session::get('browseOrder')}}';
        var exist = '{{Session::has('browseOrder')}}';
        if(exist){
            swal({
                title: "Đã duyệt đơn hàng",
                text: "",
                type: "success",
                timer: 1200,
                showConfirmButton: false,
                position: 'top-end',
            });
        }
    </script>
@stop
