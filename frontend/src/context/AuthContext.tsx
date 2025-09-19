import { createContext, useContext, useState, ReactNode } from "react";
import userService, { User } from "../services/userService";

interface AuthContextType {
  user: User | null;
  login: (user: User) => void;
  logout: () => void;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<User | null>(null);

  const login = async (user: User) => {
    const validatedUser: User = await userService.validateUser(user);
    const isValidUser = validatedUser.username !== null
    console.log(`Is valid user: ${isValidUser}`);
    if (isValidUser) {
        setUser(validatedUser);
    } else {
        // handle error
        setUser(null);
    }
  };

  const logout = () => {
    setUser(null);
  };

  return (
    <AuthContext.Provider value={{ user, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within an AuthProvider");
  }
  return context;
};
