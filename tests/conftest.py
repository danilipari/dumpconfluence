"""Test configuration and fixtures for DumpConfluence tests"""

import pytest
import tempfile
from pathlib import Path
from unittest.mock import Mock, patch


@pytest.fixture
def temp_dir():
    """Create a temporary directory for tests"""
    with tempfile.TemporaryDirectory() as tmpdir:
        yield Path(tmpdir)


@pytest.fixture
def mock_confluence_response():
    """Mock Confluence API response"""
    return {
        "id": "123456",
        "title": "Test Page",
        "body": {
            "storage": {
                "value": "<p>Test content with <ac:image><ri:attachment ri:filename='test.png' /></ac:image></p>"
            }
        },
        "space": {
            "key": "TEST"
        },
        "version": {
            "createdDate": "2024-01-01T00:00:00Z"
        }
    }


@pytest.fixture
def mock_requests():
    """Mock requests module"""
    with patch('dumpconfluence.core.requests') as mock:
        response = Mock()
        response.status_code = 200
        response.json.return_value = {}
        response.content = b"fake image data"
        mock.get.return_value = response
        yield mock


@pytest.fixture
def confluence_backup(temp_dir):
    """Create a ConfluenceBackup instance for testing"""
    from dumpconfluence.core import ConfluenceBackup

    return ConfluenceBackup(
        confluence_url="https://test.atlassian.net",
        email="test@example.com",
        api_token="test-token",
        output_dir=str(temp_dir)
    )