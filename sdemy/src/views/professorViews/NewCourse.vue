<template>
	<div class="new-course flex-col flex w-full">
		<div class="flex border-b py-4 px-4 w-full text-xl font-bold">
			<span>New Course</span>
		</div>
		<div class="flex flex-col w-1/2 px-16">
			<div class="flex flex-col mt-8 w-1/2">
				<span>Name</span>
				<input class="input" type="text" autocomplete="off" v-model="form.name">
			</div>
			<div class="flex flex-col mt-8 w-1/2">
				<span>Price</span>
				<input class="input" type="number" autocomplete="off" v-model="form.price">
			</div>
			<div class="flex flex-col mt-8">
				<textarea v-model="form.description" class="border resize-none w-full rounded p-3" rows="10" placeholder="Description"></textarea>
			</div>
			<div class="flex mt-8 w-1/4">
				<div @click="createCourse()" class="button bg-blue-500">Create</div>
			</div>
		</div>
	</div>
</template>

<script>
import ModalMixin from '../../mixins/ModalMixin';
import { notificationMsg } from "../../services/BaseServices";
export default {
	name: "new-course",
	components: {},
	data() {
		return {
			form: {
				name: null,
				price: null,
				description: null,
			},
		};
	},
	mixins: [ModalMixin],
	methods: {
		createCourse() {
			this.$store.commit('appStore/setState', {
					prop: 'loader',
					value: true
				})
			this.$store.dispatch('adminStore/createCourse', this.form)
			.then((res) => {
				this.openModal('notification-modal', {
					errMsg: null,
					successMsg: notificationMsg(res, 'COURSE_CREATED_SUCCESS'),
				});
				this.$router.push({ path: '/course', query: { id: res.data.id } })
			})
			.catch((err) => {
				this.$store.commit('appStore/setState', {
						prop: 'loader',
						value: false
					})
				this.openModal('notification-modal', {
					errMsg: notificationMsg(err),
					successMsg: null,
				});
			})
		},
	},
	computed: {},
	watch: {},
};
</script>

<style></style>
