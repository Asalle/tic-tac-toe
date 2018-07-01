require('../main')

function test_init()
	init_game()
	assert_true(STATE_SPLASH == 0)
	assert_true(STATE_PLAY == 1)
	assert_true(STATE_WIN == 2)

	assert_true(gamestates[0] == splash)
	assert_true(gamestates[1] == play)
	assert_true(gamestates[2] == win)

	local expected_files = {"splash", "cross",  "round", "red",  "yellow"}
	for i, word in ipairs(expected_files) do
		assert_true(IMAGE_FILES[i] == word)
	end

	assert_true(next(img) == nil)
end

function test_wrap()
	value = 10
	assert_true(wrap(value, 1, 5) == 5)
	assert_true(wrap(value, 11, 5) == value)
	assert_true(wrap(value, 100, 500) == 100)
end

function test_play()
	play.enter()
	assert_true(done_fields)
	for i = 1, #done_fields do
		for j=1, #done_fields[i] do
			assert_true(done_fields[i][j] == 0)
		end
	end
	assert_true(next(objects) == nil)
	assert_true(turn == 0)
	assert_true(STATE == STATE_PLAY)
end

