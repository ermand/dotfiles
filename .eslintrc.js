// http://eslint.org/docs/user-guide/configuring

module.exports = {
  "extends": ["plugin:vue/essential", "@vue/standard"],
  "parserOptions": {
    "parser": "babel-eslint",
    "ecmaVersion": 2017,
    "sourceType": "module"
  },
  "root": true,
  "env": {
    "node": true
  },
  "rules": {
    "indent": [
      "error",
      2,
      {
        "SwitchCase": 1,
        "flatTernaryExpressions": true
      }
    ],
    "quotes": [
      2,
      "single",
      {
        "avoidEscape": true,
        "allowTemplateLiterals": true
      }
    ],
    "semi": [0, "always"],
    "no-undef-init": 1,
    "no-trailing-spaces": 0,
    "no-undefined": 0,
    "no-void": 0,
    "no-unused-vars": 0,
    "no-param-reassign": 0,
    "space-before-function-paren": 0,
    "vue/no-unused-vars": "error",
    "comma-dangle": 0
  }
}
