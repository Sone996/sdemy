<template>
	<div class="user-home flex-col flex w-full">
		<div class="flex border-b py-4 px-4 w-full text-xl font-bold">
			<span>Courses List</span>
		</div>
		<div class="flex w-full h-full py-16 pl-5">
            <div class="relative h-full w-3/4">
                <scroll>
			        <simple-table @singleView="singleView" :model='courses' :titles='titles'></simple-table>
                </scroll>
            </div>
		</div>
	</div>
</template>

<script>
import simpleTable from '../../components/shared/SimpleTable';
import ModalMixin from '../../mixins/ModalMixin';
export default {
	name: "user-home",
	components: {
		simpleTable,
	},
	data() {
		return {
			titles: ['Id', 'Course Name', 'Teacher Name', 'Average Mark', 'Price'],
		};
	},
	mixins: [ModalMixin],
	mounted() {
		this.fetchCourese();
	},
	methods: {
		fetchCourese() {
            this.$store.dispatch('userStore/fetchNotCompletedCourses').then( res => {
			}
			).catch( err => {
			}
			);
        },
		singleView(item) {
			this.$router.push({ path: '/course', query: { id: item.course_id } })
		}
	},
	computed: {
		courses() {
            return this.$store.getters['userStore/getState']('notCompletedCourses');
        },
	},
	watch: {},
};
</script>

<style></style>
