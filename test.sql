-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 21 2021 г., 20:30
-- Версия сервера: 8.0.23-0ubuntu0.20.04.1
-- Версия PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `parent` int NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent`, `name`) VALUES
(20, 0, 'Электронные сертификаты'),
(25, 20, 'Электроника'),
(26, 20, 'Игрушки'),
(27, 20, 'Игры и софт'),
(28, 20, 'Книги'),
(29, 20, 'Компьютерные игры'),
(30, 20, 'Компьютеры и комплектующие'),
(31, 20, 'Одежда'),
(32, 20, 'Фильмы, музыка, игры'),
(33, 20, 'Фото и видео'),
(34, 20, 'Другое'),
(35, 20, 'Путешествия'),
(36, 20, 'Автомобили'),
(37, 20, 'Аксессуары'),
(38, 20, 'Интерьер'),
(39, 20, 'Каршеринг'),
(40, 20, 'Подписки'),
(41, 20, 'Рестораны'),
(42, 20, 'Спорт'),
(43, 20, 'Косметика'),
(44, 20, 'Красота'),
(189, 0, 'Пластиковые сертификаты'),
(191, 189, 'Другое'),
(192, 0, 'Аудио Видео Фото'),
(193, 192, 'Blu-ray плееры'),
(194, 192, 'DVD-плееры'),
(195, 192, 'GPS-навигаторы'),
(196, 192, 'Аксессуары аудио-видео техники'),
(197, 196, '3D-очки'),
(198, 196, 'Skype камеры'),
(199, 196, 'Аксессуары GPS'),
(200, 196, 'Аксессуары для виниловых проигрывателей'),
(201, 196, 'Аксессуары для наушников'),
(202, 196, 'Аксессуары для проекторов'),
(203, 196, 'Беспроводные Wi-Fi и Bluetooth адаптеры'),
(205, 196, 'Дополнительные ТВ рамки'),
(206, 196, 'Зарядные устройства'),
(207, 196, 'Кабели и переходники'),
(208, 196, 'Кронштейны для проекторов'),
(209, 196, 'Кронштейны для телевизоров'),
(210, 196, 'Микрофоны'),
(211, 196, 'Модульные компоненты'),
(212, 196, 'Приставки караоке'),
(213, 196, 'Пульты ДУ'),
(214, 196, 'Стабилизаторы напряжения'),
(215, 196, 'Стойки'),
(216, 196, 'Телевизионные антенны'),
(217, 196, 'Тумбы и стойки для телевизоров'),
(218, 196, 'Чехлы для пультов ДУ'),
(219, 196, 'Чистящие средства'),
(220, 196, 'Элементы питания'),
(221, 192, 'Аксессуары для автомобиля'),
(222, 192, 'Аксессуары для приставок'),
(232, 192, 'Акустические системы'),
(233, 192, 'Видеокамеры'),
(234, 192, 'Видеорегистраторы'),
(235, 192, 'Геймпады'),
(236, 192, 'Домашние кинотеатры'),
(237, 192, 'Игровые приставки'),
(238, 192, 'Игры для приставок'),
(239, 192, 'Магнитолы'),
(240, 192, 'Медиаплееры'),
(241, 192, 'Музыкальные центры'),
(242, 192, 'Наушники'),
(243, 192, 'Портативная акустика'),
(244, 192, 'Приемники цифрового телевидения'),
(245, 192, 'Проекторы'),
(247, 192, 'Проигрыватели виниловых пластинок'),
(248, 192, 'Радар-детекторы'),
(249, 192, 'Радиоприемники'),
(250, 192, 'Ресиверы'),
(251, 192, 'Светомузыка'),
(252, 192, 'Синтезаторы и миди-клавиатуры'),
(253, 192, 'Спутниковое и цифровое телевидение'),
(254, 192, 'Телевизоры'),
(255, 192, 'Телескопы'),
(256, 192, 'Усилители'),
(257, 192, 'Фонокорректоры'),
(258, 192, 'Фотоаппараты мгновенной печати'),
(259, 192, 'Цифровые фотоаппараты'),
(260, 192, 'Цифровые фоторамки и фотоальбомы'),
(261, 192, 'Экраны для проекторов'),
(262, 192, 'Экшн-камеры'),
(263, 192, 'Электронные настольные часы'),
(283, 0, 'Для дома'),
(284, 283, 'Автохолодильники'),
(285, 283, 'Аксессуары для аромадиспенсеров'),
(287, 283, 'Аксессуары для гладильных прессов'),
(288, 283, 'Аксессуары для дачи'),
(289, 283, 'Аксессуары для швейных машин'),
(290, 283, 'Аксессуары к моющим аппаратам'),
(291, 283, 'Аксессуары к пароочистителям'),
(292, 283, 'Аксессуары к пылесосам'),
(293, 283, 'Аксессуары к утюгам'),
(294, 283, 'Аромадиспансеры и диффузоры'),
(295, 283, 'Ведра для мусора'),
(296, 283, 'Вертикальные пылесосы'),
(298, 283, 'Гладильные доски'),
(299, 283, 'Гладильные прессы'),
(300, 283, 'Гладильные системы'),
(301, 283, 'Детские товары'),
(302, 283, 'Для уборки'),
(303, 283, 'Дозаторы для жидкого мыла'),
(304, 283, 'Ершики для унитаза'),
(305, 283, 'Зонты'),
(306, 283, 'Корзины для белья'),
(307, 283, 'Лампы'),
(308, 283, 'Машинки для удаления катышков'),
(309, 283, 'Мойки высокого давления'),
(310, 283, 'Мойщики окон'),
(311, 283, 'Настольные лампы'),
(312, 283, 'Оверлоки'),
(313, 283, 'Органайзеры для раковины'),
(314, 283, 'Отпариватели для одежды'),
(315, 283, 'Пароочистители'),
(316, 283, 'Подарочные карты'),
(317, 283, 'Подложки для раковины'),
(318, 283, 'Пылесосы'),
(319, 283, 'Роботы-пылесосы'),
(320, 283, 'Сифоны'),
(321, 283, 'Стаканы для зубных щеток'),
(322, 283, 'Сушилки для белья'),
(323, 283, 'Сушилки для обуви'),
(324, 283, 'Сушилки для рук'),
(325, 283, 'Устройства для розлива пива'),
(326, 283, 'Утюги'),
(327, 283, 'Фонари'),
(328, 283, 'Цифровые метеостанции'),
(329, 283, 'Часы'),
(330, 283, 'Швейные машинки'),
(331, 0, 'Для кухни'),
(332, 331, 'Аксессуары для кухни'),
(333, 332, 'Аксессуары для блендеров'),
(334, 332, 'Аксессуары для вакуумной упаковки'),
(335, 332, 'Аксессуары для гриля'),
(336, 332, 'Аксессуары для декантера'),
(337, 332, 'Аксессуары для йогуртницы'),
(338, 332, 'Аксессуары для морожениц'),
(339, 332, 'Аксессуары для мультиварок'),
(340, 332, 'Аксессуары для мясорубок'),
(341, 332, 'Аксессуары для СВЧ'),
(342, 332, 'Аксессуары для систем подачи вин'),
(343, 332, 'Аксессуары для соковыжималок'),
(344, 332, 'Аксессуары для тостеров'),
(345, 332, 'Аксессуары для уличных грилей'),
(346, 332, 'Аксессуары для хлебопечи'),
(347, 332, 'Аксессуары для чайников'),
(348, 332, 'Аксессуары и картриджи для очистки воды'),
(349, 332, 'Кронштейны для СВЧ'),
(350, 332, 'Насадки для кухонных комбайнов'),
(351, 332, 'Насадки для паста-машин'),
(352, 332, 'Насадки и аксессуары для миксеров'),
(353, 332, 'Сменные ножи для ломтерезок'),
(354, 331, 'Аэрогрили'),
(355, 331, 'Блендеры'),
(356, 331, 'Блинницы'),
(357, 331, 'Вакуумные упаковщики'),
(358, 331, 'Вафельницы'),
(359, 331, 'Вспениватели молока'),
(360, 331, 'Генераторы водородной воды'),
(361, 331, 'Грили'),
(362, 331, 'Декантеры'),
(363, 331, 'Йогуртницы'),
(364, 331, 'Кофеварки'),
(365, 331, 'Кофейные станции'),
(366, 331, 'Кофемашины'),
(367, 331, 'Кофемашины капсульные'),
(368, 331, 'Кофемолки'),
(369, 331, 'Кухонные весы'),
(370, 331, 'Кухонные измельчители'),
(371, 331, 'Кухонные комбайны'),
(372, 331, 'Ломтерезки'),
(373, 331, 'Маринаторы'),
(374, 331, 'Машинки для пасты'),
(375, 331, 'Микроволновые печи'),
(376, 331, 'Миксеры'),
(377, 331, 'Мини-печи'),
(378, 331, 'Мороженицы'),
(379, 331, 'Мультиварки'),
(380, 331, 'Мультишефы'),
(381, 331, 'Мясорубки'),
(382, 331, 'Настольные плиты'),
(383, 331, 'Пароварки'),
(384, 331, 'Посуда'),
(385, 384, 'Аксессуары для вина'),
(386, 384, 'Бутылки для масла'),
(387, 384, 'Вакуумные контейнеры'),
(388, 384, 'Венчики'),
(389, 384, 'Графины'),
(390, 384, 'Держатели бумажных полотенец'),
(391, 384, 'Диспенсеры'),
(392, 384, 'Диспенсеры для фольги'),
(393, 384, 'Для мороженого'),
(394, 384, 'Дуршлаги'),
(395, 384, 'Емкости для холодных напитков'),
(396, 384, 'Заварочные чайники'),
(397, 384, 'Защитные экраны'),
(398, 384, 'Кастрюли'),
(399, 384, 'Ковшики для кухни'),
(400, 384, 'Кокоты'),
(401, 384, 'Кондитерские принадлежности'),
(402, 384, 'Консервные ножи'),
(403, 384, 'Контейнеры для еды'),
(404, 384, 'Крышки для посуды'),
(405, 384, 'Кухонные лопатки'),
(406, 384, 'Кухонные ножи'),
(407, 384, 'Кухонные принадлежности'),
(408, 384, 'Ланч-боксы'),
(409, 384, 'Мельницы для специй'),
(410, 384, 'Наборы посуды'),
(411, 384, 'Ножеточки'),
(412, 384, 'Ножницы кухонные'),
(413, 384, 'Овощерезки'),
(414, 384, 'Овощечистки'),
(415, 384, 'Органайзеры для кухни'),
(416, 384, 'Открывалки для бутылок'),
(417, 384, 'Подставки для ножей'),
(418, 384, 'Подставки под горячее'),
(419, 384, 'Половники'),
(420, 384, 'Полотенца для кухни'),
(421, 384, 'Посуда для выпечки'),
(422, 384, 'Посуда для запекания'),
(423, 384, 'Посуда для СВЧ'),
(424, 384, 'Посуда для хранения продуктов'),
(425, 384, 'Посуда столовая'),
(426, 384, 'Прессы для чеснока'),
(427, 384, 'Прихватки'),
(428, 384, 'Разделочные доски'),
(429, 384, 'Ситечки для чая'),
(430, 384, 'Сковороды'),
(431, 384, 'Скороварки'),
(432, 384, 'Сотейники'),
(433, 384, 'Сумки-холодильники'),
(434, 384, 'Сушилки для посуды'),
(435, 384, 'Тажины'),
(436, 384, 'Тазы для варенья'),
(437, 384, 'Термокружки'),
(438, 384, 'Термометры для мяса'),
(439, 384, 'Термосы'),
(440, 384, 'Френч-прессы'),
(441, 384, 'Хлебницы'),
(442, 384, 'Чайники для плиты'),
(443, 384, 'Штопоры'),
(444, 331, 'Системы подачи вин'),
(445, 331, 'Соковыжималки'),
(446, 331, 'Су виды'),
(447, 331, 'Сушилки для овощей и фруктов'),
(448, 331, 'Сэндвичницы'),
(449, 331, 'Термопоты'),
(450, 331, 'Товары для приготовления кофе'),
(451, 450, 'Аксессуары для кофеварок'),
(452, 450, 'Аксессуары для кофемашин'),
(453, 450, 'Капсулы для кофемашин'),
(454, 450, 'Кофе'),
(455, 454, 'Кофе в зернах'),
(456, 454, 'Кофе молотый'),
(457, 331, 'Тостеры'),
(458, 331, 'Уличные грили барбекю'),
(459, 331, 'Уникальные товары'),
(460, 331, 'Фильтры для очистки воды'),
(461, 331, 'Фритюрницы'),
(462, 331, 'Хлебопечки'),
(463, 331, 'Чайники'),
(464, 331, 'Шашлычницы'),
(465, 331, 'Электрические сковороды и воки'),
(466, 331, 'Электрический вок'),
(467, 0, 'Климат'),
(468, 467, 'Аксессуары для климата'),
(469, 468, 'Аксессуары для вентиляторов'),
(470, 468, 'Аксессуары для обогревателей'),
(471, 468, 'Аксессуары для очистителей воздуха'),
(472, 468, 'Аксессуары для увлажнителей'),
(473, 468, 'Аксессуары для электрокаминов'),
(474, 468, 'Солнцезащитная пленка'),
(475, 468, 'Фильтры для климата'),
(476, 468, 'Химия для климата'),
(477, 467, 'Вентиляторы'),
(478, 467, 'Водонагреватели'),
(479, 467, 'Ионизаторы воздуха'),
(480, 467, 'Кондиционеры'),
(481, 467, 'Микроклиматические установки'),
(483, 467, 'Мойки воздуха'),
(485, 467, 'Обогреватели'),
(486, 467, 'Очистители воздуха'),
(488, 467, 'Увлажнители воздуха'),
(489, 467, 'Электрокамины'),
(490, 0, 'Красота и здоровье'),
(491, 490, 'Аксессуары'),
(492, 490, 'Бигуди'),
(493, 490, 'Зеркала макияжные'),
(494, 490, 'Косметологические аппараты'),
(495, 490, 'Маникюрные и педикюрные наборы'),
(496, 490, 'Массажеры'),
(497, 490, 'Массажные ванночки для ног'),
(498, 490, 'Машинки для стрижки'),
(499, 490, 'Медицинские товары'),
(500, 490, 'Напольные весы'),
(501, 490, 'Палки для скандинавской ходьбы'),
(502, 490, 'Плойки'),
(504, 490, 'Расчески-выпрямители'),
(505, 490, 'Стайлеры'),
(506, 490, 'Товары для спорта'),
(508, 490, 'Умные весы'),
(509, 490, 'Утюжки для волос'),
(510, 490, 'Фен-щетки'),
(511, 490, 'Фены'),
(512, 490, 'Щипцы для завивки'),
(513, 490, 'Электрические зубные щетки и ирригаторы'),
(514, 490, 'Электробритвы мужские'),
(515, 490, 'Электроодеяла и электропростыни'),
(516, 490, 'Эпиляторы и женские электробритвы'),
(517, 0, 'Крупная бытовая'),
(518, 517, 'Аксессуары'),
(519, 517, 'Винные шкафы'),
(520, 517, 'Вытяжки'),
(522, 517, 'Гладильные машины'),
(523, 517, 'Индукционные плиты'),
(524, 517, 'Морозильные камеры'),
(525, 517, 'Пароварки'),
(526, 517, 'Плиты'),
(527, 517, 'Посудомоечные машины'),
(528, 517, 'Средства по уходу'),
(529, 517, 'Стирально-сушильные машины'),
(530, 517, 'Стиральные машины'),
(531, 517, 'Сушильные машины'),
(532, 517, 'Холодильники'),
(534, 0, 'Центр инноваций'),
(535, 0, 'Цифровая техника'),
(536, 535, 'Apple iPad'),
(537, 535, 'Apple iPhone'),
(538, 535, 'IP-камеры'),
(539, 535, 'MP3-плееры'),
(540, 535, 'Аксессуары'),
(541, 540, 'Bluetooth-гарнитуры'),
(542, 540, 'USB разветвители'),
(543, 540, 'USB-флешки'),
(544, 540, 'Аксессуары Apple'),
(545, 540, 'Аксессуары для квадрокоптеров'),
(546, 540, 'Аксессуары для электронных книг'),
(547, 540, 'Беспроводные зарядные устройства'),
(548, 540, 'Бумага'),
(549, 540, 'Веб-камеры'),
(550, 540, 'Внешние жесткие диски и SSD'),
(551, 540, 'Диски'),
(552, 540, 'Для телефона'),
(553, 540, 'Зарядные устройства и адаптеры'),
(554, 540, 'Защитная пленка и стекла'),
(555, 540, 'Инверторы'),
(556, 540, 'Источники бесперебойного питания'),
(557, 540, 'Карманные проекторы'),
(558, 540, 'Картридеры'),
(559, 540, 'Картриджи'),
(561, 540, 'Клавиатуры'),
(562, 540, 'Коврик для мыши'),
(563, 540, 'Колонки'),
(564, 540, 'Комплекты клавиатуры и мыши'),
(565, 540, 'Компьютерные гарнитуры'),
(566, 540, 'Компьютерные мыши'),
(567, 540, 'Оборудование Wi-Fi и Bluetooth'),
(568, 540, 'Оптические приводы'),
(569, 540, 'Очки виртуальной реальности'),
(570, 540, 'Переходники и кабели'),
(571, 540, 'Подставки для ноутбука'),
(572, 540, 'Подставки и держатели'),
(573, 540, 'Портативные аккумуляторы'),
(574, 540, 'Программное обеспечение'),
(575, 540, 'Ремешки для умных часов'),
(576, 540, 'Рули, джойстики, геймпады'),
(577, 540, 'Сетевые фильтры'),
(578, 540, 'Сопутствующие товары'),
(579, 540, 'Стилусы'),
(580, 540, 'Сумки и чехлы для ноутбуков'),
(581, 540, 'Чехлы для жестких дисков'),
(582, 540, 'Чехлы для планшетов'),
(583, 540, 'Чехлы для смартфонов'),
(584, 535, 'Графическиe планшеты'),
(585, 535, 'Детские умные часы'),
(586, 535, 'Квадрокоптеры'),
(587, 535, 'Компьютерные кресла'),
(588, 535, 'Компьютерные столы'),
(590, 535, 'Модели на радиоуправлении'),
(591, 535, 'Мониторы'),
(592, 535, 'Моноблоки'),
(593, 535, 'МФУ'),
(594, 535, 'Ноутбуки'),
(595, 535, 'Планшеты'),
(596, 535, 'Принтеры'),
(597, 535, 'Проводные телефоны'),
(598, 535, 'Радиотелефоны'),
(599, 535, 'Рации'),
(600, 535, 'Роутеры'),
(601, 535, 'Системные блоки'),
(602, 535, 'Сканеры'),
(603, 535, 'Смартфоны'),
(604, 535, 'Товары для активного отдыха'),
(605, 535, 'Транспорт'),
(606, 605, 'Аксессуары для электротранспорта'),
(607, 605, 'Велостепперы'),
(608, 605, 'Гироскутеры'),
(609, 605, 'Моноколеса'),
(610, 605, 'Самокаты'),
(611, 605, 'Сигвеи'),
(612, 605, 'Электровелосипеды'),
(613, 605, 'Электромотоциклы'),
(614, 605, 'Электросамокаты'),
(615, 605, 'Электроскейты'),
(616, 605, 'Электроскутеры'),
(617, 535, 'Умные часы'),
(618, 535, 'Умный дом'),
(619, 535, 'Факсы'),
(620, 535, 'Фитнес-браслеты'),
(621, 535, 'Цифровые ручки'),
(622, 535, 'Электронные книги'),
(2153, 0, 'Женская парфюмерия'),
(2154, 2153, 'Духи (parfum)'),
(3716, 0, 'DJ-оборудование'),
(3717, 3716, 'CD-проигрыватели'),
(3720, 3716, 'DJ-Контроллеры'),
(3723, 3716, 'DJ-станции и комплекты'),
(3728, 3716, 'Виниловые пластинки'),
(3754, 3716, 'Проигрыватели виниловых дисков'),
(3758, 0, 'Гитары'),
(3759, 3758, 'Аксессуары для гитар'),
(3761, 3759, 'Каподастры'),
(3765, 3759, 'Медиаторы'),
(3770, 3759, 'Наборы аксессуаров для гитар'),
(3771, 3759, 'Подставки под ногу'),
(3773, 3759, 'Ремни'),
(3778, 3759, 'Слайды'),
(3779, 3759, 'Средства по уходу за инструментами'),
(3780, 3759, 'Стойки'),
(3782, 3759, 'Тренажеры для пальцев'),
(3783, 3759, 'Чехлы и кейсы'),
(3784, 3783, 'Кейсы для акустических гитар'),
(3785, 3783, 'Кейсы для бас-гитар'),
(3786, 3783, 'Кейсы для классических гитар'),
(3787, 3783, 'Кейсы для электрогитар'),
(3788, 3783, 'Чехлы для акустических гитар'),
(3789, 3783, 'Чехлы для бас-гитар'),
(3790, 3783, 'Чехлы для классических гитар'),
(3791, 3783, 'Чехлы для укулеле'),
(3792, 3783, 'Чехлы для электрогитар'),
(3793, 3758, 'Акустические гитары'),
(3798, 3793, 'Электроакустические гитары'),
(3799, 3758, 'Бас-гитары'),
(3806, 3758, 'Гитарное усиление'),
(3810, 3806, 'Кабинеты для бас-гитар'),
(3811, 3806, 'Кабинеты для электрогитар'),
(3812, 3806, 'Комбоусилители для акустических гитар'),
(3813, 3806, 'Комбоусилители для бас-гитар'),
(3814, 3806, 'Комбоусилители для электрогитар'),
(3816, 3806, 'Предусилители для бас-гитар'),
(3817, 3806, 'Предусилители для электрогитар'),
(3821, 3806, 'Усилители для бас-гитар'),
(3822, 3806, 'Усилители для электрогитар'),
(3823, 3758, 'Классические гитары'),
(3828, 3758, 'Комплектующие для гитар'),
(3830, 3828, 'Бриджи'),
(3833, 3828, 'Звукосниматели'),
(3840, 3828, 'Колки'),
(3844, 3828, 'Крепления для ремня'),
(3845, 3828, 'Лады'),
(3846, 3828, 'Панели'),
(3847, 3828, 'Порожки'),
(3853, 3758, 'Педали эффектов'),
(3856, 3853, 'Педалборды'),
(3857, 3853, 'Педали для акустических гитар'),
(3858, 3853, 'Педали для бас-гитар'),
(3859, 3853, 'Педали для электрогитар'),
(3863, 3859, 'Педали Distortion'),
(3876, 3758, 'Процессоры эффектов'),
(3877, 3876, 'Процессоры для акустических гитар'),
(3878, 3876, 'Процессоры для бас-гитар'),
(3879, 3876, 'Процессоры для электрогитар'),
(3880, 3876, 'Рэковые процессоры эффектов'),
(3881, 3758, 'Струны'),
(3883, 3881, 'Струны для акустических гитар'),
(3889, 3881, 'Струны для бас-гитар'),
(3895, 3881, 'Струны для классических гитар'),
(3896, 3881, 'Струны для укулеле'),
(3897, 3881, 'Струны для электрогитар'),
(3904, 3758, 'Тюнеры и метрономы'),
(3906, 3904, 'Камертоны'),
(3907, 3904, 'Метрономы'),
(3911, 3758, 'Укулеле (Гавайские гитары)'),
(3915, 3758, 'Электрогитары'),
(3924, 0, 'Звук'),
(3925, 3924, 'Аксессуары'),
(3926, 3925, 'Директ-боксы'),
(3928, 3925, 'Крепления для акустики'),
(3929, 3925, 'Пюпитры'),
(3931, 3925, 'Стойки для акустических систем'),
(3932, 3925, 'Чехлы и кейсы для звукового оборудования'),
(3933, 3932, 'Кейсы для музыкального оборудования'),
(3934, 3932, 'Комплектующие для кейсов'),
(3935, 3932, 'Чехлы для музыкального оборудования'),
(3936, 3924, 'Акустические системы'),
(3937, 3936, 'Активные акустические системы'),
(3939, 3936, 'Пассивные акустические системы'),
(3940, 3936, 'Портативные акустические системы'),
(3941, 3936, 'Сабвуферы'),
(3942, 3941, 'Активные сабвуферы'),
(3943, 3941, 'Пассивные сабвуферы'),
(3944, 3936, 'Системы озвучивания помещений'),
(3945, 3936, 'Сценические мониторы'),
(3946, 3936, 'Широкополосные системы'),
(3947, 3924, 'Звуковая обработка'),
(3948, 3947, 'Вокальные процессоры'),
(3949, 3947, 'Динамическая обработка'),
(3952, 3947, 'Контроллеры акустических систем'),
(3953, 3947, 'Микрофонные предусилители'),
(3956, 3924, 'Караоке оборудование'),
(3961, 3956, 'Кабели для караоке'),
(3965, 3956, 'Караоке-системы'),
(3976, 3924, 'Комплектующие'),
(3977, 3976, 'Динамики'),
(3979, 3976, 'Корпуса для акустики'),
(3980, 3976, 'Мембраны для динамиков'),
(3981, 3976, 'Рупоры для динамиков'),
(3982, 3924, 'Микшерные пульты'),
(3983, 3982, 'Активные микшеры'),
(3984, 3982, 'Аналоговые Микшеры'),
(3987, 3982, 'Цифровые микшеры'),
(3988, 3924, 'Плееры и рекордеры'),
(3989, 3924, 'Трансляционное оборудование'),
(3991, 3989, 'Мегафоны'),
(3992, 3989, 'Настенная акустика'),
(3993, 3989, 'Потолочная акустика'),
(3994, 3989, 'Рупорная акустика'),
(3995, 3989, 'Трансляционные усилители'),
(3996, 3924, 'Усилители мощности'),
(4001, 0, 'Клавишные'),
(4002, 4001, 'Аксессуары для клавишных'),
(4003, 4002, 'Адаптеры для синтезаторов'),
(4004, 4002, 'Запчасти для синтезаторов'),
(4005, 4002, 'Инструменты для настройки'),
(4006, 4002, 'Накидки для цифрового пианино'),
(4007, 4002, 'Педали для синтезаторов'),
(4008, 4002, 'Педали для цифровых пианино'),
(4009, 4002, 'Подставки для цифровых пианино'),
(4011, 4002, 'Стойки для синтезаторов'),
(4012, 4002, 'Чехлы и кейсы для синтезаторов'),
(4013, 4001, 'Акустические пианино'),
(4015, 4001, 'Банкетки'),
(4016, 4001, 'Комбо для клавишных'),
(4017, 4001, 'Синтезаторы'),
(4030, 4001, 'Студийные синтезаторы'),
(4033, 4001, 'Цифровые пианино'),
(4039, 0, 'Коммутация'),
(4040, 4039, 'Кабели в бухтах'),
(4045, 4039, 'Кабели готовые'),
(4047, 4045, 'Инструментальные'),
(4048, 4045, 'Компонентные кабели'),
(4049, 4045, 'Миди кабели'),
(4050, 4045, 'Микрофонные'),
(4051, 4045, 'Спикерные'),
(4055, 4039, 'Мультикоры'),
(4056, 4039, 'Разъемы'),
(4062, 0, 'Микрофоны'),
(4063, 4062, 'Аксессуары к микрофонам'),
(4064, 4063, 'Ветрозащита'),
(4065, 4063, 'Держатели'),
(4066, 4063, 'Капсюли'),
(4067, 4063, 'Модули фантомного питания'),
(4068, 4063, 'Стойки'),
(4072, 4062, 'Оборудование для конференций'),
(4074, 4072, 'Конференц-системы'),
(4075, 4072, 'Микрофоны для конференций'),
(4076, 4062, 'Проводные микрофоны'),
(4077, 4076, 'USB-микрофоны'),
(4078, 4076, 'Вокальные микрофоны'),
(4079, 4076, 'Инструментальные микрофоны'),
(4082, 4076, 'Студийные микрофоны'),
(4083, 4062, 'Радиосистемы'),
(4084, 4083, 'Аксессуары для радиосистем'),
(4085, 4084, 'Антенны'),
(4088, 4084, 'Крепления'),
(4093, 4083, 'Микрофоны для радиосистем'),
(4096, 4062, 'Системы персонального мониторинга'),
(4098, 0, 'Наушники'),
(4107, 0, 'Оркестровые и народные'),
(4108, 4107, 'Духовые инструменты'),
(4109, 4108, 'Аксессуары для духовых'),
(4110, 4109, 'Лигатуры'),
(4111, 4109, 'Мундштуки'),
(4113, 4109, 'Приспособление для занятия базингом'),
(4116, 4109, 'Стойки'),
(4117, 4109, 'Сурдины'),
(4118, 4109, 'Трости'),
(4120, 4108, 'Баритоны'),
(4121, 4108, 'Блокфлейты'),
(4122, 4108, 'Валторны'),
(4123, 4108, 'Гобои'),
(4124, 4108, 'Горны'),
(4125, 4108, 'Губные гармошки'),
(4133, 4108, 'Диджериду'),
(4134, 4108, 'Кларнеты'),
(4135, 4108, 'Корнеты'),
(4138, 4108, 'Саксофоны'),
(4139, 4108, 'Тенора'),
(4140, 4108, 'Тромбоны'),
(4141, 4108, 'Трубы'),
(4142, 4108, 'Тубы'),
(4144, 4108, 'Флейты'),
(4145, 4108, 'Флюгельгорны'),
(4149, 4108, 'Эуфониумы'),
(4150, 4107, 'Народные инструменты'),
(4151, 4150, 'Аккордеоны'),
(4152, 4150, 'Аксессуары для народных инструментов'),
(4156, 4152, 'Струны'),
(4159, 4150, 'Балалайки'),
(4160, 4150, 'Банджо'),
(4161, 4150, 'Баяны'),
(4162, 4150, 'Варган'),
(4163, 4150, 'Гармони'),
(4164, 4150, 'Гусли'),
(4166, 4150, 'Домры'),
(4170, 4150, 'Мандолины'),
(4174, 4107, 'Смычковые инструменты'),
(4175, 4174, 'Аксессуары для смычковых'),
(4176, 4175, 'Звукосниматели'),
(4177, 4175, 'Мостики'),
(4178, 4175, 'Подбородники'),
(4179, 4175, 'Подструнники'),
(4181, 4175, 'Смычки'),
(4183, 4175, 'Стойки'),
(4184, 4175, 'Струнодержатели'),
(4185, 4175, 'Струны'),
(4187, 4174, 'Альты'),
(4188, 4174, 'Виолончели'),
(4189, 4174, 'Дирижерские палочки'),
(4191, 4174, 'Контрабасы'),
(4192, 4174, 'Скрипки'),
(4193, 4174, 'Электровиолончель'),
(4194, 4174, 'Электроскрипки'),
(4200, 0, 'Свет'),
(4201, 4200, 'Аксессуары и комплектующие для света'),
(4202, 4201, 'Кейсы для светового оборудования'),
(4206, 4201, 'Стойки для световых приборов'),
(4207, 4200, 'Генераторы эффектов'),
(4208, 4207, 'Генераторы дыма'),
(4209, 4207, 'Генераторы мыльных пузырей'),
(4210, 4207, 'Генераторы тумана'),
(4211, 4207, 'Генераторы тяжелого дыма'),
(4213, 4207, 'Комплектующие для генераторов эффектов'),
(4216, 4200, 'Приборы и программы управления'),
(4217, 4216, 'Диммеры'),
(4218, 4216, 'Программные контроллеры'),
(4219, 4200, 'Световые приборы и эффекты'),
(4220, 4219, 'Зеркальные шары'),
(4221, 4219, 'Лазеры'),
(4222, 4219, 'Приборы с полным движением'),
(4223, 4219, 'Приборы смены цвета'),
(4224, 4219, 'Приборы эффектов'),
(4225, 4219, 'Прожекторы'),
(4226, 4219, 'Сканеры'),
(4227, 4219, 'Стробоскопы'),
(4228, 4219, 'Ультрафиолетовые светильники'),
(4229, 4200, 'Светодиодные приборы и эффекты'),
(4230, 0, 'Студия'),
(4231, 4230, 'MIDI интерфейсы / контроллеры / терменвоксы'),
(4244, 4230, 'Звуковые карты'),
(4245, 4244, 'Звуковые карты внешние'),
(4252, 4244, 'Звуковые карты интегрируемые'),
(4255, 4230, 'Программное обеспечение'),
(4256, 4255, 'Обновления версий'),
(4257, 4255, 'Подключаемые модули'),
(4258, 4255, 'Секвенсоры и редакторы'),
(4259, 4230, 'Студийные мониторы'),
(4264, 4230, 'ЦАП / АЦП конвертеры'),
(4265, 4230, 'Цифровые портостудии'),
(4266, 0, 'Ударные'),
(4273, 4266, 'Акустические ударные'),
(4276, 4273, 'Малые барабаны'),
(4279, 4273, 'Ударные установки'),
(4280, 4266, 'Барабанные палочки'),
(4287, 4266, 'Перкуссия'),
(4288, 4287, 'Агого'),
(4297, 4287, 'Бонги'),
(4298, 4287, 'Бубенцы'),
(4299, 4287, 'Бубны'),
(4300, 4287, 'Вудблоки'),
(4301, 4287, 'Глокеншпиль'),
(4302, 4287, 'Глюкофоны'),
(4303, 4287, 'Гуиро'),
(4304, 4287, 'Дарбуки'),
(4305, 4287, 'Детская перкуссия'),
(4306, 4287, 'Джембе'),
(4307, 4287, 'Думбеки'),
(4308, 4287, 'Кабаса'),
(4309, 4287, 'Калимба'),
(4310, 4287, 'Кастаньеты'),
(4311, 4287, 'Кахоны'),
(4312, 4287, 'Клавес'),
(4313, 4287, 'Ковбеллы'),
(4314, 4287, 'Колокольчики'),
(4315, 4287, 'Конги'),
(4317, 4287, 'Ксилофоны'),
(4318, 4287, 'Маракасы'),
(4319, 4287, 'Металлофоны'),
(4320, 4287, 'Наборы перкуссии'),
(4321, 4287, 'Окарины'),
(4322, 4287, 'Поющие чаши'),
(4323, 4287, 'Рейнстик'),
(4324, 4287, 'Стомпбокс'),
(4325, 4287, 'Тамбурины'),
(4326, 4287, 'Тимбалес'),
(4327, 4287, 'Треугольники'),
(4328, 4287, 'Трещотка'),
(4329, 4287, 'Хлопушки'),
(4330, 4287, 'Чаймсы'),
(4331, 4287, 'Шейкеры'),
(4332, 4287, 'Шумовые эффекты'),
(4333, 4287, 'Этнические барабаны'),
(4334, 4266, 'Пластики'),
(4339, 4266, 'Стойки, стулья, педали'),
(4341, 4339, 'Наборы стоек'),
(4342, 4339, 'Педали'),
(4343, 4339, 'Рамы'),
(4345, 4339, 'Стойки для малых барабанов'),
(4346, 4339, 'Стойки для тарелок'),
(4347, 4339, 'Стойки для томов'),
(4348, 4339, 'Стойки для хай-хета'),
(4350, 4266, 'Тарелки'),
(4365, 4266, 'Электронные ударные'),
(4367, 4365, 'Драм-машины'),
(4368, 4365, 'Электронная перкуссия'),
(4369, 4365, 'Электронные установки'),
(4380, 0, 'LEGO');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `vendor` varchar(100) DEFAULT NULL,
  `model` varchar(150) DEFAULT NULL,
  `vendorCode` varchar(100) DEFAULT NULL,
  `typePrefix` varchar(100) DEFAULT NULL,
  `groupId` int DEFAULT NULL,
  `dealerID` int NOT NULL,
  `inStock` int NOT NULL,
  `available` tinyint(1) NOT NULL,
  `downloadable` tinyint(1) NOT NULL,
  `price` float NOT NULL,
  `discountPrice` float DEFAULT NULL,
  `category` varchar(150) NOT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `annotation` text,
  `termsConditions` text,
  `activationRules` text,
  `termsOfUse` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
