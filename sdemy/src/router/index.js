import Vue from "vue";
import VueRouter from "vue-router";
import { ROLES } from "../constants/constants";
import { routerService } from './router.service'

Vue.use(VueRouter);

const routes = [
	{
		path: "/",
		component: () =>
			import(/* webpackChunkName: "app-layout" */ "@/layouts/AppLayout"),
		children: [
			// user pages
			{
				path: "/home",
				name: "dashboard",
				beforeEnter: routerService.routerGuards,
				meta: {
				  allowedRoles: [ROLES.student],
				},
				component: () =>
					import(/* webpackChunkName: "user-home" */ "@/views/userViews/UserHome"),
			},
			{
				path: "/member-profile",
				name: "member-profile",
				beforeEnter: routerService.routerGuards,
				meta: {
				  allowedRoles: [ROLES.student],
				},
				component: () =>
					import(/* webpackChunkName: "member-profile" */ "@/views/userViews/UserProfile"),
			},
			// END :: user pages

			// professor pages
			{
				path: "/professor-home",
				name: "professor-dashboard",
				beforeEnter: routerService.routerGuards,
				meta: {
				  allowedRoles: [ROLES.professor],
				},
				component: () =>
					import(/* webpackChunkName: "professor-home" */ "@/views/professorViews/ProfessorHome"),
			},
			{
				path: "/member-list",
				name: "member-list",
				beforeEnter: routerService.routerGuards,
				meta: {
				  allowedRoles: [ROLES.professor],
				},
				component: () =>
					import(/* webpackChunkName: "member-list" */ "@/views/professorViews/MemberList"),
			},
			{
				path: "/professor-profile",
				name: "professor-profile",
				beforeEnter: routerService.routerGuards,
				meta: {
				  allowedRoles: [ROLES.professor],
				},
				component: () =>
					import(/* webpackChunkName: "professor-profile" */ "@/views/professorViews/ProfessorProfile"),
			},
			{
				path: "/new-course",
				name: "new-course",
				beforeEnter: routerService.routerGuards,
				meta: {
				  allowedRoles: [ROLES.professor],
				},
				component: () =>
					import(/* webpackChunkName: "new-course" */ "@/views/professorViews/NewCourse"),
			},
			// END :: professor pages
			// shared pages
			{
				path: "/course",
				name: "course",
				beforeEnter: routerService.routerGuards,
				meta: {
				  allowedRoles: [ROLES.professor],
				},
				component: () =>
					import(/* webpackChunkName: "course" */ "@/views/shared/SingleCourse"),
			},
			// END :: shared pages

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
