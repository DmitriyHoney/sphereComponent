<template>

<div class="wrap">
  <b-form-group>
    <template v-for="(ctgry, i) in ctgries" >
        <div :key="`ctgry-${ i + 1 }`" class="ctgry-item">
          <div
            :indeterminate="ctgry.indeterminate"
            @click="onChangeCtgry(i)"
          >
            <b-icon v-if="!ctgry.checked" class="icon" icon="chevron-right"></b-icon>
            <b-icon v-else class="icon" icon="chevron-down" ></b-icon>
            {{ ctgry.sectionName }}
          </div>
        </div>
      <transition name="fade"  :key="`subctgry-${ i }`">
        <b-form-group
          :key="`subctgry-${ i }`"
          class="ctgry-item__subctgry"
          v-show="ctgry.checked"
        >
          <b-form-checkbox
            v-for="(subctgry, j) in ctgry.children"
            name="ctgry-radio"
            :key="`subctgry-${ j + 1 }`"
            :value="`ctgry${i}-item${j}-$${subctgry.sectionName}`"
            @click="setIndeterminate(i, j)"
          >
            {{ subctgry.sectionName }}
          </b-form-checkbox>
        </b-form-group>
      </transition>
    </template>
  </b-form-group>
</div>
  

</template>

<script>

  import {
    BFormGroup,
    BFormCheckbox,
    BIcon,
  } from 'bootstrap-vue';
  
export default {
  

  name: 'App',
  data() {
    return {
      ctgries: [
        {
          sectionName: 'Культура',
          oid: 'URL1',
          cid: 'URL2',
          checked: false,
          children: [
            {
              sectionName: 'Галерея',
              oid: 'URL11',
              cid: 'URL22',
            },
            {
              sectionName: 'Библиотека',
              oid: 'URL11',
              cid: 'URL22',
            }
          ]
        },
        {
          sectionName: 'Образование',
          oid: 'URL3',
          cid: 'URL4',
          checked: false,
          children: [
            {
              sectionName: 'Институты',
              oid: 'URL33',
              cid: 'URL44',
            }
          ]
        },
        {
          sectionName: 'Здоровье',
          oid: 'URL5',
          cid: 'URL6',
          checked: false,
          children: [
            {
              sectionName: 'ЗОЖ',
              oid: 'URL33',
              cid: 'URL44',
            }
          ]
        },

      ]
    }
  },
  methods: {
   setIndeterminate(i, j) {
      this.subctgriesActive = this.ctgries[i].children[j].sectionName;
      this.categoryNameActive = this.ctgries[i].sectionName;

    },
    onChangeCtgry(i) {
      if (this.ctgries[i].checked)
        this.ctgries[i].checked = false
      else
        this.ctgries[i].checked = true
    },
  },
  computed: {
   
  },
  components: {
    BFormGroup,
    BFormCheckbox,
    BIcon,
    //BFormRadio,
  }
}
</script>

<style>
  .wrap {
    width: 320px;
  }
  .ctgry-item {
    padding: 5px 0px;
    cursor: pointer;
  }

  .ctgry-icon{
    padding-right: 20px;
  }

  .icon {
    color: #000;
  }

  .ctgry-item__subctgry .custom-radio {
    margin: 7px 5px 7px 15px;
  }

  .fade-enter-active, .fade-leave-active {
    transition: opacity .3s;
  }
  .fade-enter, .fade-leave-to /* .fade-leave-active до версии 2.1.8 */ {
    opacity: 0;
  }
</style>
