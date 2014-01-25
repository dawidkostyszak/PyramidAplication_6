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

        $('.link_more').live("click", function() {
            var $button = $(this),
                $row = $(this).parents('tr'),
                $name = $row.find('td[class="name_list"]');
            waiting($button);

            $.getJSON('/history_refresh?item='+ $name.text() , function(data) {
                if (data.a_price === null) {
                    data.a_price = 0.0;
                }
                if (data.n_price === null) {
                    data.n_price = 0.0;
                }
                $row.find('td[name="a_price"]').text(data.a_price);
                $row.find('td[name="n_price"]').text(data.n_price);
                $row.find('td[name="date"]').text(data.date);
                $row.find('td[name="searched_count"]').text(data.count + ' times');

            })
            .success(function() {refreshed($button);})
            .error(function() {alert('Refreshing error...');});

            function waiting(obj) {
                $(obj).parent().html($('<img>', {src: '/static/img/loader.gif', id:'spinner'}));
            }

            function refreshed(obj) {
                $('#spinner').parent().html(obj);
            }
        });
    });
    </script>
</body>
</html>