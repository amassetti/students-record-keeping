import { createContext, useContext, useState, ReactNode } from "react";
import userService, { User } from "../services/userService";

interface AuthContextType {
  user: User | null;
  error: string | null;
  login: (user: User) => void;
  logout: () => void;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<User | null>(null);
  const [error, setError] = useState<string | null>(null);

  const login = async (user: User) => {
    try {
      setError(null);
      const validatedUser: User = await userService.validateUser(user);
      let message;
      if (validatedUser && validatedUser.username) {
          setUser(validatedUser);
      } else {
          // handle error
          setUser(null);
          setError("Invalid username or password");
      }
    } catch (err: any) {
      // Catch backend or network errors
      console.error("Login error:", err);
      setUser(null);
      setError(""+err)
    }

  };

  const logout = () => {
    setUser(null);
    setError(null)
  };

  return (
    <AuthContext.Provider value={{ user, error, login, logout }}>
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
