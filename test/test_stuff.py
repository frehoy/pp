from pp.lib.worker import do_work


def test_answer():
    assert do_work() == 22
