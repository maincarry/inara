// migrations/2_deploy.js
const Token = artifacts.require("InaraToken");

module.exports = async function (deployer) {
  await deployer.deploy(Token, 100000);
};
