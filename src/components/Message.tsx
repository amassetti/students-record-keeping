
interface Props {
    message: string;
}

const Message = ({message} : Props) => {
    return (
        <p>{message}</p>
    );
}

export default Message;