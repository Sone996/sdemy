<template>
    <div class="single-course-component flex flex-col text-xl">
        <span class="py-4">Students on this course</span>
        <simple-table :model='data' :titles='titles'></simple-table>
    </div>
</template>

<script>
import simpleTable from '../../components/shared/SimpleTable.vue';
  export default {
    name: 'single-course-component',
    components: {
        simpleTable,
    },
    data() {
      return {
		titles: ['User Id', 'User', 'Course Start Date', 'Complete'],
      };
    },
    props: {
        data: {
            type: Object | null,
            required: true,
        },
    },
    methods: {},
    computed: {},
    watch: {},
  };
</script>

<style></style>
