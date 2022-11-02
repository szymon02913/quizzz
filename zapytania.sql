CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  `is_right` varchar(45) DEFAULT NULL,
  `questions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `answers`
--

INSERT INTO `answers` (`id`, `content`, `is_right`, `questions_id`) VALUES
(1, '18', '1', 1),
(2, '17', '0', 1),
(3, '19', '0', 1),
(4, '17', '0', 2),
(5, '18', '0', 2),
(6, '19', '1', 2),
(7, '18', '1', 3),
(8, '19', '0', 3),
(9, '17', '0', 3),
(10, 'pawel', '1', 4),
(11, 'oskar', '1', 4),
(12, 'pawel 2', '1', 4),
(13, 'kacper', '0', 4),
(14, 'szymi', '0', 4),
(15, 'pawel', '1', 5),
(16, 'oskar', '1', 5),
(17, 'milosz', '1', 5),
(18, 'kapi', '0', 5),
(19, 'pawel 2', '0', 5),
(20, '2', '0', 6),
(21, '2-(-2)', '1', 6),
(22, '6-2', '1', 6),
(23, '3', '0', 6),
(24, 'pies', '0', 7),
(25, 'kot', '1', 7),
(26, 'tygrys', '1', 7),
(27, 'chomik', '0', 7),
(28, 'gruby', '1', 8),
(29, 'fajny', '1', 8),
(30, 'szczeka', '0', 8),
(31, 'warczy', '0', 8),
(32, 'godfist', '1', 9),
(33, 'gruby', '0', 9),
(34, 'chudy', '0', 9),
(35, 'mati', '0', 9),
(36, '1', '0', 10),
(37, '2', '0', 10),
(38, '3', '0', 10),
(39, '4', '1', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `questions`
--

INSERT INTO `questions` (`id`, `content`) VALUES
(1, 'W jakim wieku Jest Szymon '),
(2, 'Ile lat ma Paweł'),
(3, 'Ile lat ma Kacper'),
(4, 'kto gra na duzo na kompie'),
(5, 'kto ma prawko'),
(6, 'ile to 2+2'),
(7, 'Jakie zwierze To najlepsy przyjaciel czlowieka'),
(8, 'ktore okreslenia pasuja do kota'),
(9, 'jakie ksywki ma Paweł'),
(10, 'Ile lat ucze sie w tej szkole');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students_checks`
--

CREATE TABLE `students_checks` (
  `id` int(11) NOT NULL,
  `answers_id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students_has_tests`
--

CREATE TABLE `students_has_tests` (
  `id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tests`
--

CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tests_has_questions`
--

CREATE TABLE `tests_has_questions` (
  `id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`,`questions_id`),
  ADD KEY `fk_answers_questions` (`questions_id`);

--
-- Indeksy dla tabeli `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `students_checks`
--
ALTER TABLE `students_checks`
  ADD PRIMARY KEY (`id`,`answers_id`,`questions_id`,`tests_id`,`students_id`),
  ADD KEY `fk_students_checks_answers1` (`answers_id`),
  ADD KEY `fk_students_checks_questions1` (`questions_id`),
  ADD KEY `fk_students_checks_tests1` (`tests_id`),
  ADD KEY `fk_students_checks_students1` (`students_id`);

--
-- Indeksy dla tabeli `students_has_tests`
--
ALTER TABLE `students_has_tests`
  ADD PRIMARY KEY (`id`,`students_id`,`tests_id`),
  ADD KEY `fk_students_has_tests_students1` (`students_id`),
  ADD KEY `fk_students_has_tests_tests1` (`tests_id`);

--
-- Indeksy dla tabeli `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tests_has_questions`
--
ALTER TABLE `tests_has_questions`
  ADD PRIMARY KEY (`id`,`tests_id`,`questions_id`),
  ADD KEY `fk_tests_has_questions_tests1` (`tests_id`),
  ADD KEY `fk_tests_has_questions_questions1` (`questions_id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `fk_answers_questions` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `students_checks`
--
ALTER TABLE `students_checks`
  ADD CONSTRAINT `fk_students_checks_answers1` FOREIGN KEY (`answers_id`) REFERENCES `answers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_checks_questions1` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_checks_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_checks_tests1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `students_has_tests`
--
ALTER TABLE `students_has_tests`
  ADD CONSTRAINT `fk_students_has_tests_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_has_tests_tests1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `tests_has_questions`
--
ALTER TABLE `tests_has_questions`
  ADD CONSTRAINT `fk_tests_has_questions_questions1` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tests_has_questions_tests1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

