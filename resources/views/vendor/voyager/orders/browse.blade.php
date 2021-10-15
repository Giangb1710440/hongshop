@extends('voyager::master')

@section('head')

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://unpkg.com/sweetalert2@7.18.0/dist/sweetalert2.all.js"></script>
    <script src="https://unpkg.com/sweetalert2@7.18.0/dist/sweetalert2.all.js"></script>
@endsection

@section('page_title', __('voyager::generic.viewing').' '.$dataType->getTranslatedAttribute('display_name_plural'))


@section('page_header')
    <style>
        h2{
            text-align: center;
        }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản Lý ĐƠn Hàng</h2>
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
                <h3>Danh sách đơn hàng</h3>
                <div class="table-responsive">
                    <table class="table-hover">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Khách hàng</th>
                            <th scope="col">Ngày đặt hàng</th>
                            <th scope="col">Tổng tiền</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Tùy chọn</th>
                        </tr>
                        </thead>
                        <tbody id="users-crud">
                        @php( $orders = DB::table('orders')->latest()->paginate(10))
                        @foreach($orders as $key => $order)
                            <tr id="tr_{{ $order->id }}">

                                <td data-label="STT">
                                    {{ $key + 1 }}
                                </td>

                                <td data-label="Khách hàng">
                                    @if($order->user_id == null)
                                        @php($customer = DB::table('customers')->where('id', $order->customer_id)->get())
                                        @foreach($customer as $customer)
                                            {{ $customer->fullname }}
                                        @endforeach
                                    @else
                                        @php($user = DB::table('users')->where('id', $order->user_id)->get())
                                        @foreach($user as $user)
                                            {{ $user->name }}
                                        @endforeach
                                    @endif

                                </td>

                                <td data-label="Ngày đặt hàng">
                                    {{ $order->order_date }}
                                </td>

                                <td data-label="Tổng tiền">
                                    {{ number_format($order->total_money) }} VNĐ
                                </td>

                                <td data-label="Trạng thái">
                                    @if($order->status == 1)
                                        Đã duyệt
                                    @else
                                        Chưa duyệt
                                    @endif
                                </td>

                                <td data-label="Tùy chọn">
                                    @if($order->status == 1)
                                        <a class="btn btn-danger" role="button" title="Hủy đơn" href="{{ route('cancelOrder', $order->id) }}" >
                                            <i class="fa fa-refresh" aria-hidden="true"></i>
                                        </a>
                                    @else
                                        <a class="btn btn-success" role="button" title="Duyệt" href="{{ route('browseOrder', $order->id) }}">
                                            <i class="fa fa-exchange" aria-hidden="true"></i>
                                        </a>
                                    @endif

                                        <a href="{{ route('orderDetail', $order->id) }}" class="btn btn-info" title="Chi tiết">
                                            <i class="fa fa-eye" aria-hidden="true"></i>
                                        </a>
                                </td>

                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="navbar-right" style="margin-right: 16px;">
                {{ $orders->links() }}
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

        var msg1 = '{{Session::get('create_teacher')}}';
        var exist1 = '{{Session::has('create_teacher')}}';
        if(exist1){
            swal({
                title: "Đã thêm giáo viên thành công.",
                text: "",
                type: "success",
                timer: 1200,
                showConfirmButton: false,
                position: 'top-end',

    </script>
@stop
