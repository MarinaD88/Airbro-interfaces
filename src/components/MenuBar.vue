<template>
  <div class="menu-bar">
    <div class="logo-wrap">
      <img
        src="@/Common/Icons/AirBroIconBlack.png"
        alt="AirBroLogo"
        class="airbro-logo"
      />
      <div class="powerd">Powered by NFTizer</div>
    </div>
    <div class="connect-wrapper">
      <app-button
        v-if="!address"
        buttonClass="connect-metamask"
        text="Connect wallet"
        @click="loginOrSignUp()"
      />
      <user-address-and-balance v-else />
    </div>
  </div>
</template>

<script>
import { useStore } from "vuex";
import { computed } from "vue";
import { ethereumService } from "@/main";
import useContracts from "@/composables/useContracts";
import AppButton from "@/elements/AppButton";
import UserAddressAndBalance from "@/components/UserAddressAndBalance";
// import { useRouter } from "vue-router";

export default {
  name: "MenuBar",
  components: {
    AppButton,
    UserAddressAndBalance,
  },
  setup() {
    const store = useStore();
    // const router = useRouter();
    const { loginOrSignUp } = useContracts(store, ethereumService);
    const address = computed(() => store.getters["contracts/getAddress"]);

    // const disconnect = async () => {
    //   await store.dispatch("contracts/resetState");
    //   await ethereumService.disconnectProvider();
    //   await router.push("/");
    // };

    return {
      loginOrSignUp,
      address,
      // disconnect,
    };
  },
};
</script>
<style lang="scss" scoped src="@/Common/Styles/menuBar.scss"></style>
