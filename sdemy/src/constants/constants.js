export const TOKEN_LS_NAME = "token";

export const PERMISSION_ERRORS = [
  "ERR_MISSING_SESSION_ID",
  "ERR_SESSION_NOT_VALID",
  "ERR_BAD_ROLE",
];

export const ROLES = {
  generic: "generic_login",
  frontDesk: "front_desk",
  gymManager: "gym_manager",
  accounting: "accounting",
  admin: "admin",
};

export const usersRoles = [
	{
		name: "Generički login",
		value: ROLES.generic,
	},
	{
		name: "Pult",
		value: ROLES.frontDesk,
	},
	{
		name: "Menadžer",
		value: ROLES.gymManager,
	},
	{
		name: "Računovodstvo",
		value: ROLES.accounting,
	},
	{
		name: "Admin",
		value: ROLES.admin,
	},
];
