package s108122020015.model;

import java.util.List;

public class Page <T> {
    private int pageNumber;
    private int pageSize;
    private int totalPages;
    private int totalElements;
    private List<T> content;

    public void setPage(int pageNumber, int pageSize, int totalElements) {
        if (pageSize < 0 || pageSize > 5) {
            pageSize = 5;
        }
        this.pageSize = pageSize;
        this.totalElements = totalElements;
        totalPages = (int) Math.ceil((double) totalElements / (double) pageSize);
        if (pageNumber < 0) {
            pageNumber = 1;
        }
        if (pageNumber > totalPages) {
            pageNumber = totalPages;
        }
        this.pageNumber = pageNumber;
    }

    public void setContent(List<T> content) {
        this.content = content;
    }

    public int getNextPage() {
        return pageNumber != totalPages ? pageNumber + 1 : totalPages;
    }

    public int getPreviousPage() {
        return pageNumber > 1 ? pageNumber - 1 : 1;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public int getTotalElements() {
        return totalElements;
    }

    public List<T> getContent() {
        return content;
    }
}
