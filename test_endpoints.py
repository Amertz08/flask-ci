import unittest

from flask import url_for
from flask_testing import TestCase

from app import create_app


class TestApp(TestCase):

    def create_app(self):
        return create_app()

    def test_index(self):
        resp = self.client.get(url_for('main.index'))
        with open('version.txt', 'r') as f:
            _hash = f.read()
        self.assert200(resp)
        self.assertEqual(resp.data, f'Hello {_hash}'.encode())


if __name__ == '__main__':
    unittest.main()
