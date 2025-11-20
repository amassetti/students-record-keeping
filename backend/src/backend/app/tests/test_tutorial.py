from app.utils.tutorial import multiply, get_first_and_last, sum

def test_multiply():
    assert multiply() == 0
    assert multiply(0, 1, 2, 3) == 0
    assert multiply(1) == 1
    assert multiply(1, 2) == 2
    assert multiply(2, 2) == 4
    assert multiply(1, 2, 3) == 6
    assert multiply(2, 3) == 6
    assert multiply(10, 10, 10) == 1000
    assert multiply(1000, 1000, 1000) == 1000000000

def test_sum():
    assert sum(1, 2, 3, 4) == 10
    assert sum(0, 1, 0) == 1
    assert sum() == 0

def test_get_first_and_last():
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    first, others, last = get_first_and_last(numbers)

    assert first == 1
    assert last == 9
    assert others == [2, 3, 4, 5, 6, 7, 8]