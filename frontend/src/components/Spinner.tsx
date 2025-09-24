interface Props {
    isLoading: boolean;
}

const Spinner = ({ isLoading } : Props) => {

    return (
        <>
        { isLoading && <div className="spinner-border"></div> }
        </>
    );

}

export default Spinner;