// types.ts file  /utils/types.ts


export type JWTPayload = {
    id: number;
    isAdmin: boolean;
    userEmail: string;
    firstName: string;
    lastName: string;

};
