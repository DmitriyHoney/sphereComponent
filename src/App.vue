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
            v-model="activeSubcategories"
            name="ctgry-radio"
            :key="`subctgry-${ j + 1 }`"
            :value="`ctgry${i}-item${j}-$${subctgry.sectionName}`"
            @change="setIndeterminate(i, j)"

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
      activeSubcategories: [],
      activeCategories: [],
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
      console.log(this.activeSubcategories);
    },
    onChangeCtgry(i) {
      if (this.ctgries[i].checked) {
        for (let k = 0; k < this.activeCategories.length; k++) {
          if (this.ctgries[i].sectionName === this.activeCategories[k]) {
            this.activeCategories.splice(k, 1)
          }
        }
        this.ctgries[i].checked = false;
      }
      else{
        this.activeCategories.push(this.ctgries[i].sectionName)
        this.ctgries[i].checked = true
      }
      console.log(this.activeCategories)
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

  .ctgry-item__subctgry {
      margin: 7px 5px 7px 15px;
    }

  .fade-enter-active, .fade-leave-active {
    transition: opacity .7s;
  }
  .fade-enter, .fade-leave /* .fade-leave-active до версии 2.1.8 */ {
    transition: opacity .7s;
    opacity: 0;
  }
</style>
