<template>
<div class="course flex flex-col w-full">
    <div class="flex items-start py-4 px-4 border-r text-xl font-bold h-1/2 border-b">
        <div class="flex flex-col w-1/3 items-start">
            <span>Name: {{course ? course.name : ''}}</span>
            <span>Price: {{course ? course.price : ''}}</span>
        </div>
        <div class="flex w-3/4 border whitespace-pre-line h-full overflow-y-auto mb-4">
            <span>{{ course ? course.description : "" }}</span>
        </div>
    </div>
    <div class="flex flex-col h-1/2">
        <!-- set this for admin view, for user should be comments and make components -->
        <span>Students on this course</span>
        <simple-table :model='model' :titles='titles'></simple-table>
    </div>
</div>
</template>

<script>
import ModalMixin from '../../mixins/ModalMixin';
import simpleTable from '../../components/shared/SimpleTable.vue';

import {
    notificationMsg
} from "../../services/BaseServices";
export default {
    name: 'course',
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
    mixins: [ModalMixin],
    mounted() {
        if (!this.$route.query.id) {
            this.$router.push('/');
        }
        this.initLoad();
    },
    methods: {
        initLoad() {
            let id = this.$route.query.id;
            this.$store.dispatch('adminStore/fetchSingleCours', id)
                .then(() => {
                    this.$store.commit('appStore/setState', {
                        prop: 'loader',
                        value: false
                    })
                }).catch(err => {
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
    computed: {
        course() {
            return this.$store.getters['adminStore/getState']('singleCours');
        }
    },
    watch: {},
};
</script>

<style></style>
