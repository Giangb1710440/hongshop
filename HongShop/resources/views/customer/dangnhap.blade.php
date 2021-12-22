<!DOCTYPE html>
<html lang="en">
<head>
    <title>Đăng nhập</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="{{asset('public/dangnhap/images/icons/favicon.ico')}}"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('public/dangnhap/vendor/bootstrap/css/bootstrap.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('public/dangnhap/fonts/font-awesome-4.7.0/css/font-awesome.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('public/dangnhap/fonts/Linearicons-Free-v1.0.0/icon-font.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('public/dangnhap/vendor/animate/animate.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('public/dangnhap/vendor/css-hamburgers/hamburgers.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('public/dangnhap/vendor/animsition/css/animsition.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('public/dangnhap/vendor/select2/select2.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('public/dangnhap/vendor/daterangepicker/daterangepicker.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('public/dangnhap/css/util.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('public/dangnhap/css/main.css')}}">
    <!--===============================================================================================-->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script src="https://unpkg.com/sweetalert2@7.18.0/dist/sweetalert2.all.js"></script>
    <script src="https://unpkg.com/sweetalert2@7.18.0/dist/sweetalert2.all.js"></script>
</head>
<body>

<div class="limiter">
    <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
        <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
            <form class="login100-form validate-form flex-sb flex-w" action="{{ route('postDangNhap') }}" method="post" enctype="multipart/form-data">
                @csrf

					<span class="login100-form-title p-b-53">
						Đăng nhập
					</span>

                    @if(session()->has('message'))
                        <div class="alert alert-success">
                            {{ session()->get('message') }}
                        </div>
                    @endif

                <a href="#" class="btn-face m-b-20">
                    <i class="fa fa-facebook-official"></i>
                    Facebook
                </a>

                <a href="#" class="btn-google m-b-20">
                    <img src="{{asset('public/dangnhap/images/icons/icon-google.png')}}" alt="GOOGLE">
                    Google
                </a>

                <div class="p-t-31 p-b-9">
						<span class="txt1">
							Tên đăng nhập
						</span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Vui lòng nhập email">
                    <input class="input100" type="email" name="email" id="email" onblur="return isEmail()">
                    <p>{{ $errors->first('email') }}</p>
                </div>

                <div class="p-t-13 p-b-9">
						<span class="txt1">
							Mật khẩu
						</span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Vui lòng nhập mật khẩu">
                    <input class="input100" type="password" name="pass" >
                    <p style="color: red;">{{ $errors->first('pass') }}</p>
                </div>

                <div class="container-login100-form-btn m-t-17">
                    <button class="login100-form-btn" type="submit">
                        Đăng nhập
                    </button>
                </div>

                <div class="container-login100-form-btn m-t-17" >
                    <a href="{{ url('/') }}" style="text-align: center; padding-left: 200px;">Quay lại</a>
                </div>
            </form>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<script>
    var msg = '{{Session::get('register_success')}}';
    var exist = '{{Session::has('register_success')}}';
    if(exist){
        swal({
            title: "Đăng ký tài khoản thành công. Hãy đăng nhập!",
            text: "",
            type: "success",
            timer: 2000,
            showConfirmButton: false,
            position: 'top-end',
        });
    }
</script>

<script>
    function isEmail() {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var email = $('#email').val();
        if(email !==''){
            if(regex.test(email) == false){
                alert('Email không đúng định dạng. Vui lòng nhập lại');
            }
        }
    }
</script>

<!--===============================================================================================-->
<script src="{{asset('public/dangnhap/vendor/jquery/jquery-3.2.1.min.js')}}"></script>
<!--===============================================================================================-->
<script src="{{asset('public/dangnhap/vendor/animsition/js/animsition.min.js')}}"></script>
<!--===============================================================================================-->
<script src="{{asset('public/dangnhap/vendor/bootstrap/js/popper.js')}}"></script>
<script src="{{asset('public/dangnhap/vendor/bootstrap/js/bootstrap.min.js')}}"></script>
<!--===============================================================================================-->
<script src="{{asset('public/dangnhap/vendor/select2/select2.min.js')}}"></script>
<!--===============================================================================================-->
<script src="{{asset('public/dangnhap/vendor/daterangepicker/moment.min.js')}}"></script>
<script src="{{asset('pblic/dangnhap/vendor/daterangepicker/daterangepicker.js')}}"></script>
<!--===============================================================================================-->
<script src="{{asset('public/dangnhap/vendor/countdowntime/countdowntime.js')}}"></script>
<!--===============================================================================================-->
<script src="{{asset('public/dangnhap/js/main.js')}}"></script>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>
</html>
