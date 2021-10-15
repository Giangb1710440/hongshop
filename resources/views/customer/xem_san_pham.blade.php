@extends('layout.master')
@section('title', 'Xem sản phẩm')
@section('content')
    <!-- Product Shop Section Begin -->
    <section class="product-shop spad page-details">
        <div class="container">
            <div class="row">
            </div>
            <style>
                .rating_circle{
                    width: 220px;
                    height: 220px;
                    border-radius: 50%;
                    border: 1px none;
                    font-size: 50px;
                    font-weight: bold;
                }
                .rating_text{
                    margin-top:1px;
                    font-size: 20px;
                }

                /* Stylingand links*/
                .starrating > input {display: none;}
                .starrating > label:before {
                    content: "\f005";
                    margin: 5px;
                    font-size:50px;
                    font-family: FontAwesome, serif;
                    display: inline-block;
                }
                .starrating > label{color: #4a5568;}
                .starrating > input:checked ~ label{ color: #ffca08 ; }
                .starrating > input:hover ~ label{ color: #ffca08 ;  }
            </style>
            @foreach($sp as $sp)
                @foreach($ct as $ct)
                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-lg-6">
                                <div class="product-pic">
                                    @foreach((array)json_decode($ct->image, true) as $image)
                                        <a href="">
                                            <img class="product-big-img" src="{{ voyager::image($image) }}" alt="">
                                        </a>
                                        @break
                                    @endforeach
                                    <div class="zoom-icon">
                                        <i class="fa fa-search-plus"></i>
                                    </div>
                                </div>

                            <div class="product-thumbs">
                                <div class="product-thumbs-track ps-slider owl-carousel">
                                        @foreach((array)json_decode($ct->image, true) as $image)
                                            <div class="pt" data-imgbigurl="{{ voyager::image($image) }}">
                                                <img src="{{ voyager::image($image) }}" alt=""></div>
                                        @endforeach
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product-details">
                                <div class="pd-title">
                                    <h3>{{ $sp->name_product }}</h3>
                                    <a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>
                                </div>
                                <div class="pd-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <span>(5)</span>
                                </div>
                                <div class="pd-desc">
                                    <p>{!! $ct->describe !!}</p>
                                    <h4>{{ number_format($ct->price) }} đ</h4>
                                </div>
                                <div class="pd-color">
                                    <h6>Màu sắc</h6>
                                    <div class="pd-color-choose">
                                        @php($colorProduct = DB::table('color_products')->where('product_id', $ct->id)->get())
                                        @foreach($colorProduct as $colorProduct)
                                            @php($color = DB::table('colors')->where('id', $colorProduct->color_id)->get())
                                            @foreach($color as $color)
                                                @if($color->color == 'Đen')
                                                    <div class="cc-item">
                                                        <input type="radio" id="cc-black">
                                                        <label for="cc-black"></label>
                                                    </div>
                                                @endif
                                                @if($color->color == 'Xanh Nhạt')
                                                    <div class="cc-item">
                                                        <input type="radio" id="cc-xanhnhat">
                                                        <label for="cc-xanhnhat" class="cc-xanhnhat"></label>
                                                    </div>
                                                @endif
                                                @if($color->color == 'Xanh Dương')
                                                    <div class="cc-item">
                                                        <input type="radio" id="cc-xanhduong">
                                                        <label for="cc-xanhduong" class="cc-xanhduong"></label>
                                                    </div>
                                                @endif
                                                    @if($color->color == 'Trắng')
                                                        <div class="cc-item">
                                                            <input type="radio" id="cc-trang">
                                                            <label for="cc-trang" class="cc-trang"></label>
                                                        </div>
                                                    @endif
                                                    @if($color->color == 'Nâu')
                                                        <div class="cc-item">
                                                            <input type="radio" id="cc-nau">
                                                            <label for="cc-nau" class="cc-nau"></label>
                                                        </div>
                                                    @endif
                                                    @if($color->color == 'Đỏ')
                                                        <div class="cc-item">
                                                            <input type="radio" id="cc-do">
                                                            <label for="cc-do" class="cc-do"></label>
                                                        </div>
                                                    @endif
                                                    @if($color->color == 'Hồng')
                                                        <div class="cc-item">
                                                            <input type="radio" id="cc-hong">
                                                            <label for="cc-hong" class="cc-hong"></label>
                                                        </div>
                                                    @endif
                                                    @if($color->color == 'Tím')
                                                        <div class="cc-item">
                                                            <input type="radio" id="cc-tim">
                                                            <label for="cc-tim" class="cc-tim"></label>
                                                        </div>
                                                    @endif
                                                    @if($color->color == 'Kem')
                                                        <div class="cc-item">
                                                            <input type="radio" id="cc-kem">
                                                            <label for="cc-kem" class="cc-kem"></label>
                                                        </div>
                                                    @endif
                                                    @if($color->color == 'Vàng')
                                                    <div class="cc-item">
                                                        <input type="radio" id="cc-vang">
                                                        <label for="cc-vang" class="cc-vang"></label>
                                                    </div>
                                                    @endif
                                                    @if($color->color == 'Xám')
                                                        <div class="cc-item">
                                                            <input type="radio" id="cc-xam">
                                                            <label for="cc-xam" class="cc-xam"></label>
                                                        </div>
                                                    @endif
                                                    @if($color->color == 'Be')
                                                        <div class="cc-item">
                                                            <input type="radio" id="cc-be">
                                                            <label for="cc-be" class="cc-be"></label>
                                                        </div>
                                                    @endif
                                            @endforeach
                                        @endforeach
                                    </div>
                                </div>
                                <div class="pd-size-choose">
                                    <h6>Kích cỡ</h6>
                                    @foreach($size as $size)
                                        @php($ct_size = DB::table('sizes')->where('id', $size->size_id)->get())
                                        @foreach($ct_size as $ct_size)
                                            <div class="sc-item">
                                                <input type="radio" id="sm-size">
                                                <label for="sm-size">{{ $ct_size->size }}</label>
                                            </div>
                                        @endforeach
                                    @endforeach
                                </div>
                                <div class="quantity">
                                    {{--<div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>--}}
                                    <a href="{{ route('themGioHang', $sp->id) }}" class="primary-btn pd-cart">Thêm giỏ hàng</a>
                                </div>
                                <ul class="pd-tags">
                                    @php($danhmuc = DB::table('categories')->where('id', $sp->category_id)->get())
                                    @foreach($danhmuc as $danhmuc)
                                        <li><span>Danh mục</span>: {{ $danhmuc->name }}</li>
                                        <li><span>Từ khóa</span>: {{ $danhmuc->name }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="product-tab">
                        <div class="tab-item">
                            <ul class="nav" role="tablist">
                                <li>
                                    <a class="active" data-toggle="tab" href="#tab-1" role="tab">Giới thiệu sản phẩm</a>
                                </li>
                                @if(Auth()->check())
                                    <li>
                                        <a data-toggle="tab" href="#tab-2" role="tab">Đánh giá</a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#tab-3" role="tab">Bình luận</a>
                                    </li>
                                @endif
                            </ul>
                        </div>
                        <div class="tab-item-content">
                            <div class="tab-content">
                                <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                    <div class="product-content">
                                        <div class="row">
                                            <div class="col-lg-7">
                                                <h5>Chi tiết sản phẩm</h5>
                                                <p>{!! $ct->describe !!}</p>
                                            </div>
                                            <div class="col-lg-5">
                                                <img src="img/product-single/tab-desc.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                @if(Auth()->check())
                                    <div class="tab-pane fade" id="tab-2" role="tabpanel">
                                        <div class="card pb-0 mt-2">
                                            <div class="card-body pb-0">
                                                <div class="row">
                                                    <div class="col-12 col-md-4">
                                                        <button class="rating_circle">
                                                            @php($avg_rating = DB::table('rating_stars')->where('product_id', $sp->id)->avg('rating_star'))
                                                            {{ round($avg_rating, 1) }} / <span class="text-warning">5 <i class="fa fa-star" style="color:#ffca08;"></i></span>
                                                        </button>
                                                    </div>
                                                    <div class="col-10 col-md-6">
                                                        <div class="progress mt-2" style="height:15px;">
                                                            <div class="progress-bar bg-success" style="width:100%;height:15px;">5 Sao</div>
                                                        </div>
                                                        <div class="progress mt-3" style="height:15px;">
                                                            <div class="progress-bar bg-info" style="width:80%;height:15px;">4 Sao</div>
                                                        </div>
                                                        <div class="progress mt-3" style="height:15px;">
                                                            <div class="progress-bar bg-primary" style="width:60%;height:15px;">3 Sao</div>
                                                        </div>
                                                        <div class="progress mt-3" style="height:15px;">
                                                            <div class="progress-bar bg-warning" style="width:40%;height:15px;">2 Sao</div>
                                                        </div>
                                                        <div class="progress mt-3" style="height:15px;">
                                                            <div class="progress-bar bg-danger" style="width:20%;height:15px;">1 Sao</div>
                                                        </div>
                                                    </div>
                                                    <div class="col-2 col-md-2 mt-0">
                                                        <div class="row">
                                                            <b class="rating_text">
                                                                @php($count_5 = DB::table('rating_stars')->where([['product_id','=',$sp->id],['rating_star', '=',5]])->count())
                                                                {{ $count_5 }}
                                                            </b>
                                                        </div>
                                                        <div class="row">
                                                            <b class="rating_text">
                                                                @php($count_4 = DB::table('rating_stars')->where([['product_id','=',$sp->id],['rating_star', '=',4]])->count())
                                                                {{ $count_4 }}
                                                            </b>
                                                        </div>
                                                        <div class="row">
                                                            <b class="rating_text">
                                                                @php($count_3 = DB::table('rating_stars')->where([['product_id','=',$sp->id],['rating_star', '=',3]])->count())
                                                                {{ $count_3 }}
                                                            </b>
                                                        </div>
                                                        <div class="row">
                                                            <b class="rating_text">
                                                                @php($count_2 = DB::table('rating_stars')->where([['product_id','=',$sp->id],['rating_star','=',2]])->count())
                                                                {{ $count_2 }}
                                                            </b>
                                                        </div>
                                                        <div class="row">
                                                            <b class="rating_text">
                                                                @php($count_1 = DB::table('rating_stars')->where([['product_id','=',$sp->id],['rating_star','=',1]])->count())
                                                                {{ $count_1 }}
                                                            </b>
                                                        </div>
                                                    </div>
                                                </div>

                                                @if (Auth::check())
                                                    <form action="{{ route('postRatingStar', [Auth::user()->id, $sp->id]) }}" method="post" id="FormSubmit">
                                                        @csrf
                                                        <div class="starrating risingstar d-flex justify-content-center flex-row-reverse">
                                                            <input type="radio" id="star5" name="rating" value="5" onclick="return SubmitFormFunction();"/><label for="star5" title="5 star"></label>
                                                            <input type="radio" id="star4" name="rating" value="4" onclick="return SubmitFormFunction();"/><label for="star4" title="4 star"></label>
                                                            <input type="radio" id="star3" name="rating" value="3" onclick="return SubmitFormFunction();"/><label for="star3" title="3 star"></label>
                                                            <input type="radio" id="star2" name="rating" value="2" onclick="return SubmitFormFunction();"/><label for="star2" title="2 star"></label>
                                                            <input type="radio" id="star1" name="rating" value="1" onclick="return SubmitFormFunction();"/><label for="star1" title="1 star"></label>
                                                        </div>
                                                    </form>
                                                @else
                                                    <div class="starrating risingstar d-flex justify-content-center flex-row-reverse">
                                                        <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 star" onclick="MessageFunction()"></label>
                                                        <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 star" onclick="MessageFunction()"></label>
                                                        <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 star" onclick="MessageFunction()"></label>
                                                        <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 star" onclick="MessageFunction()"></label>
                                                        <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 star" onclick="MessageFunction()"></label>
                                                    </div>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab-3" role="tabpanel">
                                        <div class="customer-review-option">
                                            @php($sumComment = DB::table('comments')->where('product_id', $sp->id)->count())
                                            @php($comments = DB::table('comments')->where('product_id', $sp->id)->get())
                                            <h4>{{ $sumComment }} bình luận</h4>
                                            <div class="comment-option">
                                                @foreach($comments as $comment)
                                                    <div class="co-item">
                                                        @php($user = DB::table('users')->where('id', $comment->user_id)->first())
                                                        @php($ratingStar = DB::table('rating_stars')->where('user_id', $comment->user_id)
                                                                ->where('product_id', $comment->product_id)->first())
                                                        <div class="avatar-pic">
                                                            <img src="{{ asset('public/storage/'.$user->avatar) }}" alt="">
                                                        </div>
                                                        <div class="avatar-text">
                                                            <div class="at-rating">
                                                                @if(isset($ratingStar))
                                                                    @if($ratingStar->rating_star == 1)
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    @elseif($ratingStar->rating_star == 2)
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    @elseif($ratingStar->rating_star == 3)
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    @elseif($ratingStar->rating_star == 4)
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    @elseif($ratingStar->rating_star == 5)
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                    @else
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    @endif
                                                                @endisset
                                                            </div>
                                                            <h5>{{ $user->name }} <span>{{ \Carbon\Carbon::create($comment->created_at)->format('d-m-Y') }}</span></h5>
                                                            <div class="at-reply">{{ $comment->content }}</div>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            </div>

                                            <div class="leave-comment">
                                                <h4>Thêm bình luận</h4>
                                                <form action="{{ route('addComment', [Auth::user()->id, $sp->id]) }}" class="comment-form" method="post">
                                                    @csrf
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <textarea placeholder="Messages" name="comment"></textarea>
                                                            <button type="submit" class="site-btn">Bình luận</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            @endforeach
        </div>

        @if(session()->has('message_success'))
            <script>
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: '{{ session()->get('message_success') }}',
                    showConfirmButton: false,
                    timer: 1000
                })
            </script>
        @endif

        @if(session()->has('message_error'))
            <script>
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: '{{ session()->get('message_error') }}',
                    showConfirmButton: false,
                    timer: 3000
                })
            </script>
        @endif

        @if(session()->has('comment_success'))
            <script>
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: '{{ session()->get('comment_success') }}',
                    showConfirmButton: false,
                    timer: 3000
                })
            </script>
        @endif
    </section>

    <script>
        $(document).ready(function(){
            $('[data-toggle="popover"]').popover();
        });

        function MessageFunction() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Đăng nhập để đánh giá sao',
                showConfirmButton: false,
                timer: 1500
            });
            setTimeout(function() {
                location.href = "{{ url('/login') }}";
            }, 2000);
        }

        function SubmitFormFunction() {
            document.getElementById("FormSubmit").submit();
        }
    </script>
    <!-- Product Shop Section End -->

    <!-- Related Products Section End -->
    <!-- Related Products Section End -->
@endsection
