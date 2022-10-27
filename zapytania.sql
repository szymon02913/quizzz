CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  `questions_id` int(11) NOT NULL,
  `is_right` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `answers`
--

INSERT INTO `answers` (`id`, `content`, `questions_id`, `is_right`) VALUES
(1, '4', 1, 1),
(2, '5', 1, 0),
(3, '6', 1, 0),
(4, '6', 2, 1),
(5, '7', 2, 0),
(6, '8', 2, 0),
(7, '8', 3, 1),
(8, '9', 3, 0),
(9, '10', 3, 0),
(10, 'zielony', 4, 1),
(11, 'czerwony', 4, 1),
(12, 'biały', 4, 1),
(13, 'różowy', 4, 0),
(14, 'szary', 4, 0),
(15, 'niebieski', 5, 1),
(16, 'biały', 5, 1),
(17, 'czerwony', 5, 1),
(18, 'szary', 5, 0),
(19, 'żółty', 5, 0),
(20, 'kot', 6, 1),
(21, 'kot', 6, 1),
(22, 'mysz', 6, 0),
(23, 'szczur', 6, 0),
(24, 'pies', 7, 1),
(25, 'pies', 7, 1),
(26, 'ptak', 7, 0),
(27, 'ryba', 7, 0),
(28, 'samochód', 8, 1),
(29, 'samochód', 8, 1),
(30, 'dom', 8, 0),
(31, 'szkoła', 8, 0),
(32, 'samolot', 9, 1),
(33, 'samolot', 9, 1),
(34, 'papier', 9, 0),
(35, 'kamień', 9, 0),
(36, 'czajnik', 10, 1),
(37, 'czajnik', 10, 1),
(38, 'pralka', 10, 0),
(39, 'widelec', 10, 0);

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
(1, 'ile to 2+2?'),
(2, 'ile to 3+3?'),
(3, 'ile to 4+4?'),
(4, 'kolory flagi Włoch'),
(5, 'kolory flagi Francji'),
(6, 'znajdź kota'),
(7, 'znajdź psa'),
(8, 'znajdź samochód'),
(9, 'znajdź samolot'),
(10, 'znajdź czajnik');

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
  `students_id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students_has_tests`
--

CREATE TABLE `students_has_tests` (
  `students_id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tests`
--

CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `data` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tests_has_questions`
--

CREATE TABLE `tests_has_questions` (
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
  ADD PRIMARY KEY (`id`,`answers_id`,`students_id`,`tests_id`,`questions_id`),
  ADD KEY `fk_students_checks_answers1` (`answers_id`),
  ADD KEY `fk_students_checks_students1` (`students_id`),
  ADD KEY `fk_students_checks_tests1` (`tests_id`),
  ADD KEY `fk_students_checks_questions1` (`questions_id`);

--
-- Indeksy dla tabeli `students_has_tests`
--
ALTER TABLE `students_has_tests`
  ADD PRIMARY KEY (`students_id`,`tests_id`),
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
  ADD PRIMARY KEY (`tests_id`,`questions_id`),
  ADD KEY `fk_tests_has_questions_questions1` (`questions_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT dla tabeli `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `students_checks`
--
ALTER TABLE `students_checks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
