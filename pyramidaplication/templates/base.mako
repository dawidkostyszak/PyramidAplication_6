<!DOCTYPE HTML>
<html>
<head>
    <title>Compare products prices between Nokaut and Allegro</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <link rel="stylesheet" href="${request.static_url('pyramidaplication:static/css/style.css')}" type="text/css" media="screen" charset="utf-8" />
</head>
<body>
    <div id="container">
        <div class="main_box">
            <div class="head">
                <div class="logo_img"><a href="/"><img src="${request.static_url('pyramidaplication:static/img/logo.png')}" alt="logo"></a></div>
                <div class="logo_txt">
                    Compare products
                    <div class="logo_txt_small">We will help you find and compare products</div>
                </div>
                <div class="box_login">
                    % if request.user:
                        <a class="btn btn-unsuccess" href="/logout">Logout ${request.user.login}</a>
                    % else:
                        <a class="btn btn-success" href="/register">Register</a>
                        <a class="btn" href="/login">Login</a>
                    % endif
                </div>
            </div>
            ${next.body()}
        </div>
        <div class="footer">
            <img src="${request.static_url('pyramidaplication:static/img/logo_stx.png')}" alt="logo_stx"/>
        </div>
    </div>
    <script type="text/javascript" src="${request.static_path('pyramidaplication:static/js/jquery-1.8.3.min.js')}"></script>


    <script type="text/javascript">
    $(document).ready(function() {

        $('.more  button').click(function() {
            var $name = $('.name_list');
            var $a_price = $('td[name="a_price"]');
            var $n_price = $('td[name="n_price"]');
            var $date = $('td[name="date"]');
            var $count = $('td[name="searched_count"]');
            var button = $(this);
            waiting(button);

            $.getJSON('/json?item='+ $name.text() , function(data){
            if (data.a_price == null){
            data.a_price = 0.0;
            }
            if (data.n_price == null){
            data.n_price = 0.0;
            }
            $a_price.text(data.a_price);
            $n_price.text(data.n_price);
            $date.text(data.date);
            $count.text(data.popularity);

            }).done(function() { done(button); })
            .fail(function() { alert('Refreshing error...'); });

            function waiting(obj){
            $(obj).hide();
            $(obj).parent().addClass('spinner');
            }

            function done(obj){
            $(obj).show()
            $(obj).parent().removeClass('spinner');
            }

        });
    });
    </script>
</body>
</html>