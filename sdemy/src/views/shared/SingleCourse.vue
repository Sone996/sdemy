<template>
<div class="course flex flex-col">
    <div class="flex border-b py-4 px-4 w-full text-xl font-bold">
        <span>{{course ? course.name : ''}}</span>
    </div>
</div>
</template>

<script>
import ModalMixin from '../../mixins/ModalMixin';
import {
    notificationMsg
} from "../../services/BaseServices";
export default {
    name: 'course',
    components: {},
    data() {
        return {};
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
