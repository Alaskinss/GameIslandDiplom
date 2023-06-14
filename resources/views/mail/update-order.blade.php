<h2>
Статус вашего заказа изменился на "{{$order->status}}"
</h2>
<p>
    Ссылка на ваш заказ:
    <a href="{{route('order.view', $order, true)}}">Заказ #{{$order->id}}</a>
</p>
