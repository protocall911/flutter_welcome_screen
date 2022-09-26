# Создание макетов 

Было создано три макета: Welcome Screen, Playlist Screen, Meditate Screen. Виджеты для каждого макета содержатся в классе body.dart. В отдельные классы были вынесены элементы экрана, которые использовались неоднократно с разными параметрами на вход.

## Welcome Screen

Для кнопок на экране Welcome Screen был создан класс rounded_button.dart с конструктором const. Параметры: текст, действие по нажатию, цвет кнопки, цвет текста.
Для удобства, переход на второй экран Playlist Screen осуществляется по нажатию на кнопку «Continue with Email or Phone». 

<img width="302" alt="image" src="https://user-images.githubusercontent.com/66499477/191957568-cefd5cc8-a5b2-48b0-a41f-31f557046483.png">

## Playlist Screen

Для отображения списка сессий на экране Playlist Screen был создан класс track_card.dart с конструктором const. Параметры: иконка воспроизведения, название, дата, иконка дополнительной кнопки.
На данном экране использовался компонент прокрутки SingleChildScrollView. Переход на третий экран Meditate Screen осуществляется по нажатию на кнопку «Play Next Session».

<img width="223" alt="image" src="https://user-images.githubusercontent.com/66499477/192284966-333e1d30-4010-49ff-96b5-f717c26536c7.png">

## Meditate Screen

Для экрана Meditate Screen был реализован AppBar, в котором содержатся название экрана и кнопка поиска.
В классе tag_list.dart реализован ListView с выбором категории плейлиста. При выборе элемента изменяется цвет виджета BoxDecoration и цвет текста. 
Для отображения списка плейлистов на экране был создан класс playlist_card.dart с конструктором const. Параметры: картинка, название, автор, время.

<img width="220" alt="image" src="https://user-images.githubusercontent.com/66499477/192285013-a5e67e8f-aa42-4a9a-b3f2-46acdb71d8d6.png">



