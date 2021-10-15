@extends('layout.master_profile')
@section('title', 'Đổi mật khẩu')
@section('content')

    <!-- Women Banner Section Begin -->
    <section class="women-banner spad">
        <div class="container-fluid">
            <style>
                .card-information{
                    padding-left: 1px;
                }
                /*Small devices (landscape phones, 576px and up)*/
                @media (max-width: 576px) {
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
                <div class="card-header p-2">
                    <b>Thay đổi mật khẩu</b>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-lg-8 card-information offset-lg-2">
                            <form action="{{ route('updatePassword', $user->id) }}" class="needs-validation" novalidate method="post">
                                @csrf
                                @method('PUT')
                                <div class="form-group row">
                                    <div class="col-12 col-sm-12 col-md-4 font-weight-bold">Mật Khẩu Cũ:</div>
                                    <div class="col-12 col-sm-12 col-md-8">
                                        <input type="password" class="form-control" name="inputPassOld" required placeholder="Nhập mật khẩu cũ">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-12 col-sm-12 col-md-4 font-weight-bold">Mật Khẩu Mới:</div>
                                    <div class="col-12 col-sm-12 col-md-8">
                                        <input type="password" class="form-control" name="inputPassNew" required placeholder="Nhập mật khẩu mới">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-12 col-sm-12 col-md-4 font-weight-bold">Xác Nhận Mật Khẩu:</div>
                                    <div class="col-12 col-sm-12 col-md-8">
                                        <input type="password" class="form-control" name="inputPassConfirmNew" required placeholder="Nhập xác nhận mật khẩu">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4"></div>
                                    <div class="col-md-8 text-right">
                                        <hr class="mt-0">
                                        <button type="submit" class="btn btn-danger">Thay Đổi</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    @if(session()->has('old_pass_fail'))
        <script>
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: '{{ session()->get('old_pass_fail') }}',
                showConfirmButton: false,
                timer: 3000
            })
        </script>
    @endif

    @if(session()->has('change_password_user_fail'))
        <script>
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: '{{ session()->get('change_password_user_fail') }}',
                showConfirmButton: false,
                timer: 3000
            })
        </script>
    @endif

    <script>
        // Disable form submissions if there are invalid fields
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                // Get the forms we want to add validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
@endsection
