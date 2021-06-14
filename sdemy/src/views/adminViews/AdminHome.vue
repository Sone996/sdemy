<template>
	<div class="admin-home flex-col flex w-full">
		<div class="flex border-b py-4 px-4 w-full text-xl font-bold">
			<span>My Courses</span>
		</div>
		<div class="flex w-full justify-center mt-16">
			<simple-table :model='model' :titles='titles'></simple-table>
		</div>
	</div>
</template>

<script>
import simpleTable from '../../components/shared/SimpleTable';
export default {
	name: "admin-home",
	components: {
		simpleTable,
	},
	data() {
		return {
			model: [
                { name: 'Jane Cooper', title: 'Regional Paradigm Technician', role: 'Admin', email: 'jane.cooper@example.com' },
                { name: 'Cody Fisher', title: 'Product Directives Officer', role: 'Owner', email: 'cody.fisher@example.com' },
				{ name: 'Jane Cooper', title: 'Regional Paradigm Technician', role: 'Admin', email: 'jane.cooper@example.com' },
                { name: 'Cody Fisher', title: 'Product Directives Officer', role: 'Owner', email: 'cody.fisher@example.com' },
				{ name: 'Jane Cooper', title: 'Regional Paradigm Technician', role: 'Admin', email: 'jane.cooper@example.com' },
                { name: 'Cody Fisher', title: 'Product Directives Officer', role: 'Owner', email: 'cody.fisher@example.com' },
				{ name: 'Jane Cooper', title: 'Regional Paradigm Technician', role: 'Admin', email: 'jane.cooper@example.com' },
                { name: 'Cody Fisher', title: 'Product Directives Officer', role: 'Owner', email: 'cody.fisher@example.com' },
            ],
			titles: ['Name', 'Title', 'Role', 'Email', 'Edit', 'Delete'],
		};
	},
    mounted() {},
	methods: {},
	computed: {},
	watch: {},
};
</script>

<style></style>
