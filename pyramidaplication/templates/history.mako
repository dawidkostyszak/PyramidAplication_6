<%inherit file="search.mako"/>

<div class="middle">
    <table cellpadding="0" celllspacing="0" border="0" class="list">
        <tr>
            <td>Product name</td>
            <td>Allegro price[zł]</td>
            <td>Nokaut price[zł]</td>
            <td>Date</td>
            <td>Searched</td>
        </tr>
        %for product in history_search:
        <tr name="history">
            <td class="name_list">${product.name}</td>
            <td class="price_list" name="a_price">
                ${product.a_price}
            </td>
            <td class="price_list" name="n_price">
                ${product.n_price}
            </td>
            <td class="price_list" name="date">
                ${product.date}
            </td>
            <td class="price_list" name="searched_count">
                ${product.popularity} times
            </td>
            <td class="more">
            <button class="link_more btn">Refresh</button>
            </td>
        </tr>
        %endfor
    </table>
</div>
