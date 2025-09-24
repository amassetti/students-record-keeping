import React from "react";

interface Params {
    page: number;
    totalPages: number;
    handleChangePage: (page: number) => void;
}

const TablePagination = ({page, totalPages, handleChangePage} : Params) => {

    return (
        <nav aria-label="Page navigation">
            <ul className="pagination">
            <li className="page-item"><a className="page-link" href="#" onClick={() => handleChangePage(page-1)}>Previous</a></li>
            { 
                Array.from({ length: totalPages }).map((_, i) => 
                    <li className="page-item"><a className={ page === i+1 ? "page-link active" : "page-link"} href="#" onClick={() => handleChangePage(i+1)}>{i+1}</a></li>
                )
            }
            <li className="page-item"><a className="page-link" href="#" onClick={() => handleChangePage(page+1)}>Next</a></li>
            </ul>
        </nav>
    );

}

export default TablePagination;