import Vue from "vue";
import VueRouter from "vue-router";
//import { ROLES } from "../constants/constants";
import { routerService } from './router.service'

Vue.use(VueRouter);

const routes = [
	{
		path: "/",
		component: () =>
			import(/* webpackChunkName: "app-layout" */ "@/layouts/AppLayout"),
		children: [
			{
				path: "/",
				name: "dashboard",
				//beforeEnter: routerService.routerGuards,
				// meta: {
				//   allowedRoles: [ROLES.generic, ROLES.gymManager],
				// },
				component: () =>
					import(/* webpackChunkName: "user-home" */ "@/views/userViews/UserHome"),
			},

		],
	},

	{
		path: "/login",
		name: "login",
		meta: {
			// requiresLoggedUser: false,
			//allowedRoles: Object.values(ROLES),
		},
		component: () => import(/* webpackChunkName: "login" */ "@/views/Login"),
	},
	{
		path: "/error",
		alias: "/*",
		name: "error",
		meta: {
			//allowedRoles: Object.values(ROLES),
		},
		component: () =>
			import(/* webpackChunkName: "error" */ "@/views/ErrorPage"),
	},
];

const router = new VueRouter({
	base: process.env.BASE_URL,
	routes,
	mode: "history",
	scrollBehavior(to, from, savedPosition) {
		if (savedPosition) {
			return savedPosition;
		} else {
			return { x: 0, y: 0 };
		}
	},
});

export default router;
