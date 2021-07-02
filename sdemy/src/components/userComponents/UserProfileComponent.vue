<template>
	<div class="user-profile-component flex flex-col h-full">
		<div class="flex flex-col text-xl h-full pt-6">
			<div class="flex pl-6">
				<span>My Completed Courses</span>
			</div>
			<div class="flex flex-col justify-center h-full p-16">
				<div class="relative h-full w-full">
					<scroll>
					    <simple-table :model='courses' :titles='titles'></simple-table>
            		</scroll>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import simpleTable from '../../components/shared/SimpleTable';
import ModalMixin from '../../mixins/ModalMixin';
export default {
	name: "user-profile-component",
	components: {
		simpleTable
	},
	data() {
		return {
			titles: ['Id', 'Course Name', 'Mark'],
		};
	},
	mixins: [ModalMixin],
	mounted() {
		this.$store.commit('appStore/setState', {
            prop: 'loader',
            value: true
        })
		this.fetchCompletedCourese();
	},
	methods: {
		fetchCompletedCourese() {
			let id = this.loggedUser.id;
			this.$store.dispatch('userStore/fetchCompletedCourses', id).then((res) => {
				this.$store.commit('appStore/setState', {
                        prop: 'loader',
                        value: false
                    })
			})
			.catch((err) => {
				this.$store.commit('appStore/setState', {
                        prop: 'loader',
                        value: false
                    })
			})
		}
	},
	computed: {
		courses() {
			return this.$store.getters["userStore/getState"]("completedCourses");
		},
		loggedUser() {
            return this.$store.getters["authStore/getState"]("loggedUser");
        },
	},
	watch: {},
};
</script>

<style></style>
