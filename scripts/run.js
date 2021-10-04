// Deploy smart contract to network
const main = async () => {
    // hre is Hardhat Runtime Env, passed in with `npx hardhat` command
    const waveContractFactory = await hre.ethers.getContractFactory('WavePortal');
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed(); // wait for contract to be deployed
    console.log(`Deployed to: ${waveContract.address}`);
}

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (err) {
        console.log(err);
        process.exit(1);
    }
}

runMain();