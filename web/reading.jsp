<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Reading - ${book.title}</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.10.377/pdf.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 28px;
            color: #444;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            margin: 5px 0 15px;
            line-height: 1.6;
        }

        hr {
            border: 0;
            border-top: 1px solid #ddd;
            margin: 20px 0;
        }

        .reading-content {
            margin-top: 20px;
            text-align: center;
        }

        #pdf-container {
            display: flex;
            justify-content: center;
            align-items: center;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            background-color: #f4f4f4;
            min-height: 400px;
            text-align: center;
            overflow: hidden;
        }

        canvas {
            max-width: 100%;
            height: auto;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
        }

        .pagination-controls {
            margin-top: 20px;
        }

        .pagination-controls button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            background-color: #3498db;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            margin: 0 10px;
            transition: background-color 0.3s ease;
        }

        .pagination-controls button:hover {
            background-color: #2980b9;
        }

        .page-jump {
            margin-top: 20px;
        }

        .page-jump input {
            padding: 8px 12px;
            font-size: 16px;
            width: 60px;
            margin-right: 10px;
        }

        .page-jump button {
            padding: 8px 16px;
            font-size: 16px;
            border: none;
            background-color: #2ecc71;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .page-jump button:hover {
            background-color: #27ae60;
        }

        #loading-message {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 18px;
            color: #555;
            display: none;
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            h2 {
                font-size: 24px;
            }

            p {
                font-size: 14px;
            }

            #pdf-container {
                padding: 15px;
            }

            .pagination-controls button,
            .page-jump button {
                padding: 8px 16px;
                font-size: 14px;
                margin: 0 5px;
            }

            .page-jump input {
                width: 50px;
            }
        }
    </style>

</head>
<body>
<div class="container mt-4">
    <h2>${book.title}</h2>
    <p><strong>Author:</strong> ${book.author}</p>
    <hr>
    <div class="reading-content">
        <div id="pdf-container">
            <div id="loading-message">Loading...</div>
        </div>
        <div class="pagination-controls">
            <button id="prev-page">Previous</button>
            <span>Page: <span id="current-page">1</span> / <span id="total-pages">--</span></span>
            <button id="next-page">Next</button>
        </div>
        <div class="page-jump">
            <input type="number" id="page-number-input" min="1" placeholder="Page #" />
            <button id="go-to-page">Go</button>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const url = '${book.fileUrl}';
        console.log('PDF URL:', url);
        const container = document.getElementById('pdf-container');
        const prevButton = document.getElementById('prev-page');
        const nextButton = document.getElementById('next-page');
        const currentPageSpan = document.getElementById('current-page');
        const totalPagesSpan = document.getElementById('total-pages');
        const goToPageButton = document.getElementById('go-to-page');
        const pageNumberInput = document.getElementById('page-number-input');
        const loadingMessage = document.getElementById('loading-message');

        let pdfDoc = null;
        let currentPage = 1;
        let totalPages = 0;
        const scale = 1.5;
        let canvas = null;
        let context = null;

        if (!url) {
            container.innerHTML = "<p>PDF URL is not available.</p>";
            prevButton.disabled = true;
            nextButton.disabled = true;
            goToPageButton.disabled = true;
            return;
        }

        pdfjsLib.getDocument(url).promise.then(function (pdf) {
            pdfDoc = pdf;
            totalPages = pdf.numPages;
            totalPagesSpan.textContent = totalPages;
            renderPage(currentPage);
        }).catch(function (error) {
            console.error('Error loading PDF:', error);
            container.innerHTML = "<p>Failed to load PDF.</p>";
            prevButton.disabled = true;
            nextButton.disabled = true;
            goToPageButton.disabled = true;
        });

        function renderPage(pageNumber) {
            loadingMessage.style.display = 'block';
            pdfDoc.getPage(pageNumber).then(function (page) {
                const viewport = page.getViewport({ scale: scale });

                container.innerHTML = '';
                container.appendChild(loadingMessage);

                canvas = document.createElement('canvas');
                container.appendChild(canvas);
                context = canvas.getContext('2d');
                canvas.height = viewport.height;
                canvas.width = viewport.width;

                page.render({ canvasContext: context, viewport: viewport }).promise.then(function () {
                    console.log('Page rendered:', pageNumber);
                    loadingMessage.style.display = 'none';
                }).catch(function (error) {
                    console.error('Error rendering page ' + pageNumber + ':', error);
                    loadingMessage.style.display = 'none';
                });

                currentPageSpan.textContent = pageNumber;

                prevButton.disabled = pageNumber <= 1;
                nextButton.disabled = pageNumber >= totalPages;
            }).catch(function (error) {
                console.error('Error fetching page ' + pageNumber + ':', error);
                loadingMessage.style.display = 'none';
            });
        }

        prevButton.addEventListener('click', function () {
            if (currentPage <= 1) return;
            currentPage--;
            renderPage(currentPage);
        });

        nextButton.addEventListener('click', function () {
            if (currentPage >= totalPages) return;
            currentPage++;
            renderPage(currentPage);
        });

        goToPageButton.addEventListener('click', function () {
            let desiredPage = parseInt(pageNumberInput.value);
            if (isNaN(desiredPage) || desiredPage < 1 || desiredPage > totalPages) {
                alert('Please enter a valid page number between 1 and ' + totalPages + '.');
                return;
            }
            currentPage = desiredPage;
            renderPage(currentPage);
            pageNumberInput.value = '';
        });

        pageNumberInput.addEventListener('keyup', function (event) {
            if (event.key === 'Enter') {
                goToPageButton.click();
            }
        });

    });
</script>
</body>
</html>
