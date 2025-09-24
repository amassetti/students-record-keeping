export enum ButtonType {
    BLUE = "primary",
    GRAY = "secondary",
    RED = "danger",
    GREEN = "success",
    YELLOW = "warning",
    CYAN = "info",
    LIGHT = "light",
    DARK = "dark",
    LINK = "link"
  }

interface Props {
    btnType: ButtonType;
    text: string;
    title: string;
    enabled: boolean;
    onClick: () => void;

}
const SmallButton = ({btnType, text, title, enabled, onClick} : Props) => {
    return (
        <button 
            type="button" 
            className={`btn btn-${btnType} btn-sm mx-1 ${(!enabled ? 'disabled' : '' )}`}
            title={title}
            onClick={onClick}
        >{text}</button>
    );
}

export default SmallButton;